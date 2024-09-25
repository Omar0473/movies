import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../tempelates/app_colors.dart';
import '../watchlist_tab/Api/GetMovieWatchListResponse.dart';

class BrowseListMovies extends StatelessWidget {
  final WatchListMovies movie; // Fix movie type to WatchListMovies
  const BrowseListMovies({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return ClipRRect(
      borderRadius:BorderRadius.circular(8.0.w),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius:BorderRadius.circular(8.0.w),
              child: Container(
                width: 358.w, // Responsive width with ScreenUtil
                height: 130.h, // Responsive height
                decoration: const BoxDecoration(
                  color: AppColors.sectionsColor,
              
                ),
                child: Column(
                  children: [
              
                    Row(
              
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Movie Thumbnail or placeholder
                        ClipRRect(
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(8.0.w),bottomLeft:Radius.circular(8.0.w)),
                          child: Container(
                            width: 100.w,
                            height: 130.h,
                            color: AppColors.sectionsColor,
                            child: movie.posterPath != null
                                ? ClipRRect(
                                  borderRadius:BorderRadius.only(topLeft:Radius.circular(8.0.w),bottomLeft:Radius.circular(8.0.w)),
                                  child: Image.network(
                                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                      fit: BoxFit.fill,
                                    ),
                                )
                                : Center(
                                    child: Icon(
                                      Icons.image,
                                      color: AppColors.cardColor,
                                      size: 30.sp,
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(width: 14.w),
                        // Movie Details Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Movie Title
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  movie.title ?? 'Unknown Title',
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              // Movie Release Year
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      movie.releaseDate != null
                                          ? movie.releaseDate!.split('-')[0]
                                          : 'Unknown Year',
                                      style: TextStyle(
                                        color: AppColors.descriptionColor,
                                        fontSize: 17.sp,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(width:15.w),
                                    Image.asset('assets/images/star.png',scale:0.7,),
                                    SizedBox(width:7.w),
                                    Text( '${movie.voteAverage?.toStringAsFixed(1)}',
                                      style: TextStyle(
                                        color: AppColors.descriptionColor,
                                        fontSize: 17.sp,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 10,),
                  ],
              
                ),
              ),
            ),
            SizedBox(height:5.h),
            SizedBox(
              width: 358.w,
              child: const Divider(
                color: AppColors.dividerColor,
                thickness: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
