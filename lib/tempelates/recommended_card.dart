import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Api/api_config.dart';
import 'package:movies/Api/end_points.dart';
import 'package:movies/screens/home_tab/Api/get_top_rated_movies_response.dart';
import 'package:movies/tempelates/snack_bar_temp.dart';
import 'app_colors.dart';

class RecommendedCard extends StatefulWidget {
  TopRatedMoviesData moviesData;
  RecommendedCard({required this.moviesData});
  @override
  State<RecommendedCard> createState() => _RecommendedCardState();
}
class _RecommendedCardState extends State<RecommendedCard> {
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
      movieId: widget.moviesData.id?.toInt() ?? 0,
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
      mediaId: widget.moviesData.id?.toInt() ?? 0,
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
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(5),
            ),
            width: 97.w,
            height: 186.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                    color: AppColors.sectionsColor,
                  ),
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                          '${EndPoints.imagePath}${widget.moviesData.posterPath ?? ''}',
                          fit: BoxFit.fill)),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7, left: 7),
                      child: Image.asset('assets/images/star.png'),
                    ),
                    SizedBox(width: 4.96.w),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        '${widget.moviesData.voteAverage?.toStringAsFixed(1)}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                    '${widget.moviesData.title ?? ''}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.normal),
                    overflow: TextOverflow.ellipsis,
                    maxLines:2,
                  ),
                ),
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.only(left:7,bottom:5),
                    child: Text(
                      '${widget.moviesData.releaseDate?.substring(0, 4) ?? ''}',
                      style: TextStyle(
                          color: AppColors.descriptionColor,
                          fontSize: 10,
                          fontWeight: FontWeight.normal),
                      overflow: TextOverflow.ellipsis,
                    ),
                )
              ],
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
              ? CircularProgressIndicator(
            valueColor:
            AlwaysStoppedAnimation<Color>(AppColors.yellowColor),
          )
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
