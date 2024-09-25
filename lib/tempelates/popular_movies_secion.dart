import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Api/end_points.dart';
import 'package:movies/screens/home_tab/Api/get_popular_movies_response.dart';
import 'package:movies/screens/home_tab/cubit/get_movies_cubit.dart';
import 'poster_card.dart';
import 'app_colors.dart';

class PopularMoviesSection extends StatelessWidget {
  PopularMoviesData popularMoviesData;

  PopularMoviesSection({required this.popularMoviesData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      //allows the widget to overflow the stack => no clipping
      children: [
        Container(
          height: 216.h,
          width: 412.w,
          color: AppColors.sectionsColor,
          child: Image.network(
              '${EndPoints.imagePath}${popularMoviesData.backdropPath}',
              fit: BoxFit.fill),
        ),
        Positioned(
            top: 50.h,
            bottom: 125.h,
            right: 150.w,
            left: 150.w,
            child: Image.asset('assets/images/play.png', scale: 0.95)),
        Positioned(
            top: 90.h,
            left: 21.w,
            child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: PosterCard(
                    imagePath:
                        '${EndPoints.imagePath}${popularMoviesData.posterPath}', movieId: popularMoviesData?.id?.toInt()??0,))),
        Positioned(
            top: 230.h,
            left: 164.w,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 250.w,
                    child: Text(
                      '${popularMoviesData.title}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )),
                SizedBox(height: 10.h),
                Text('${popularMoviesData.releaseDate?.substring(0,4)}',
                    style: TextStyle(
                        color: AppColors.descriptionColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                    overflow: TextOverflow.ellipsis)
              ],
            ))
      ],
    );
  }
}
