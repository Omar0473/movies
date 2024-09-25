import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/watchlist_tab/Api/GetMovieWatchListResponse.dart';
import 'app_colors.dart';

class WatchListCard extends StatelessWidget {
  final WatchListMovies movie; // Add a movie parameter

  const WatchListCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w, // Adjusted width to 358px (responsive with ScreenUtil)
      height: 102.5.h, // Adjusted height to 102.5px
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Movie Thumbnail (use movie.posterPath if available, else placeholder)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0.w),
                    child: Container(
                      width: 150.w,
                      height: 89.h,
                      color: AppColors.sectionsColor,
                      child: movie.posterPath != null
                          ? Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.backdropPath}',//Just noticed it wasn't a backdrop image
                        fit: BoxFit.cover,
                      )
                          : Center(
                        child: Icon(
                          Icons.image,
                          color: AppColors.cardColor,
                          size: 40.sp,
                        ),
                      ),
                    ),
                  ),
                  // Bookmark and Checkmark Stack (optional feature)
                  Stack(
                      children: [
                        Image.asset('assets/images/selectedBookmark.png',color:AppColors.yellowColor),
                        Positioned(
                            top:9.03.h,
                            left:7.98.w,
                            bottom:15.93.h,
                            right:7.98.w,
                            child: Image.asset('assets/images/done.png',color:Colors.white)),
                      ]
                  )

                ],
              ),
              SizedBox(width: 14.w),
              // Movie Details from WatchListMovies instance
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie Title
                    Text(
                      movie.title ?? 'Unknown Title', // Movie title
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    // Movie Release Year
                    Text(
                      movie.releaseDate != null
                          ? movie.releaseDate!.split('-')[0] // Extract year
                          : 'Unknown Year',
                      style: TextStyle(
                        color: AppColors.descriptionColor,
                        fontSize: 16.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    // There no actors so no need I guess
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          // Full-width Divider
          SizedBox(
            width: 358.w,
            child: const Divider(
              color: AppColors.dividerColor,
              thickness: 2.0,
              endIndent: 0,
            ),
          ),
        ],
      ),
    );
  }
}
