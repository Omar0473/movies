import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Api/api_config.dart'; // Use ApiConfig for API calls
import 'package:movies/Api/end_points.dart';
import 'package:movies/screens/home_tab/Api/get_upcoming_movies_response.dart';
import 'package:movies/tempelates/snack_bar_temp.dart';
import 'app_colors.dart';

class NewReleasesCard extends StatefulWidget {
  final UpcomingMovieData movieData;
  NewReleasesCard({required this.movieData});

  @override
  State<NewReleasesCard> createState() => _NewReleasesCardState();
}

class _NewReleasesCardState extends State<NewReleasesCard> {
  bool isSelected = false;
  bool isLoading = false;
  bool isCheckLoading = true;


  @override
  void initState() {
    super.initState();
    _checkIfInWatchlist();
  }

  Future<void> _checkIfInWatchlist() async {
    setState(() {
      isCheckLoading = true;
    });

    final result = await ApiConfig.isMovieInWatchlist(
      movieId: widget.movieData.id?.toInt() ?? 0,
    );

    result.fold(
          (failure) {
        print('Failed to check watchlist status: ${failure.errorMsg}');
      },
          (isInWatchlist) {
        setState(() {
          isSelected = isInWatchlist;
          //print("it is there");
        });
      },
    );

    setState(() {
      isCheckLoading = false;
    });
  }


  Future<void> _toggleWatchlist() async {
    setState(() {
      isLoading = true;
    });

    // Call the API from ApiConfig
    final result = await ApiConfig.setMovieWatchList(
      mediaId: widget.movieData.id?.toInt() ?? 0,
      watchlist: !isSelected,
    );

    result.fold(
          (failure) {
        final snackBar = SnackBarTemp.snackBarTemplate(
          content: 'Failed to update watchlist: ${failure.errorMsg}',
          backgroundColor: Colors.red,
          actionLabel: 'Retry',
          labelColor: Colors.white,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
          (response) {
        setState(() {
          isSelected = !isSelected;
        });

        final snackBar = SnackBarTemp.snackBarTemplate(
          content: isSelected
              ? 'Item added to your watchlist'
              : 'Item removed from your watchlist',
          backgroundColor: AppColors.yellowColor,
          actionLabel: 'Undo',
          labelColor: Colors.black,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isCheckLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.yellowColor),
        ),
      );
    }

    return Stack(
      children: [
        Material(
          elevation: 30,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.sectionsColor,
              borderRadius: BorderRadius.circular(5),
            ),
            width: 96.87.w,
            height: 127.74.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                '${EndPoints.imagePath}${widget.movieData.posterPath}',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: isLoading
              ? null
              : () async {
            await _toggleWatchlist();
          },
          child: isLoading
              ? CircularProgressIndicator()
              : isSelected
              ? Stack(
            children: [
              Image.asset('assets/images/selectedBookmark.png',
                  color: AppColors.yellowColor),
              Positioned(
                top: 9.03.h,
                left: 7.98.w,
                bottom: 15.93.h,
                right: 7.98.w,
                child: Image.asset('assets/images/done.png',
                    color: Colors.white),
              ),
            ],
          )
              : Stack(
            children: [
              Image.asset('assets/images/bookmark.png',
                  color: AppColors.bookmarkColor),
              Positioned(
                top: 9.03.h,
                left: 7.98.w,
                bottom: 15.93.h,
                right: 7.98.w,
                child: Image.asset('assets/images/add.png',
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
