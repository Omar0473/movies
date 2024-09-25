import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Api/api_config.dart';
import 'package:movies/Api/end_points.dart';
import 'package:movies/tempelates/snack_bar_temp.dart';
import 'app_colors.dart';

class PosterCard extends StatefulWidget {
  String imagePath;
  int movieId;
  PosterCard({required this.imagePath,required this.movieId});

  @override
  State<PosterCard> createState() => _PosterCardState();
}

class _PosterCardState extends State<PosterCard> {
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
      movieId: widget.movieId, // Replace with actual movie ID
    );

    result.fold(
          (failure) {},
          (isInWatchlist) {
        setState(() {
          isSelected = isInWatchlist;
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

    final result = await ApiConfig.setMovieWatchList(
      mediaId: widget.movieId, // Replace with actual movie ID
      watchlist: !isSelected,
    );

    result.fold(
          (failure) {
        final snackBar = SnackBarTemp.snackBarTemplate(
          content: 'Failed to update watchlist',
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
          color: AppColors.yellowColor,
        ),
      );
    }

    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: AppColors.sectionsColor,
            borderRadius: BorderRadius.circular(5)),
        width: 129.w,
        height: 199.h,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: '${EndPoints.imagePath}${widget.imagePath}',
              placeholder: (context, url) => Center(
                  child:
                  CircularProgressIndicator(color: AppColors.yellowColor)),
              errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error_outline_sharp,
                      color: AppColors.yellowColor)),
            )),
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
              ? CircularProgressIndicator(
            color: AppColors.yellowColor,
          )
              : isSelected == true
              ? Stack(children: [
            Image.asset('assets/images/selectedBookmark.png',
                color: AppColors.yellowColor),
            Positioned(
                top: 9.03.h,
                left: 7.98.w,
                bottom: 15.93.h,
                right: 7.98.w,
                child: Image.asset('assets/images/done.png',
                    color: Colors.white)),
          ])
              : Stack(children: [
            Image.asset('assets/images/bookmark.png',
                color: AppColors.bookmarkColor),
            Positioned(
                top: 9.03.h,
                left: 7.98.w,
                bottom: 15.93.h,
                right: 7.98.w,
                child: Image.asset('assets/images/add.png',
                    color: Colors.white)),
          ]))
    ]);
  }
}
