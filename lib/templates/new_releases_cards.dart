import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Api/end_points.dart';
import 'package:movies/screens/home_tab/Api/get_upcoming_movies_response.dart';
import 'package:movies/templates/snack_bar_temp.dart';

import 'app_colors.dart';
class NewReleasesCard extends StatefulWidget {
  UpcomingMovieData movieData;
  NewReleasesCard({required this.movieData});
  @override
  State<NewReleasesCard> createState() => _NewReleasesCardState();
}
class _NewReleasesCardState extends State<NewReleasesCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Material(
            elevation:30,
            borderRadius:BorderRadius.circular(5),
            child: Container(
              decoration:BoxDecoration(
                  color:AppColors.sectionsColor,
                  borderRadius:BorderRadius.circular(5)
              ),
              width:96.87.w,
              height:127.74.h,
              child:ClipRRect(
                  borderRadius:BorderRadius.circular(5),
                  child: Image.network('${EndPoints.imagePath}${widget.movieData.posterPath}',fit:BoxFit.fill)),
              //child:Image.asset('assets/images/testImage.png'),
            ),
          ),
          InkWell(
              splashColor:Colors.transparent,
              highlightColor:Colors.transparent,
              onTap:(){
                isSelected = !isSelected;
                isSelected ==true?
                setState(() {
                  final snackBar = SnackBarTemp.snackBarTemplate(content:'Item added to your watchlist', backgroundColor: AppColors.yellowColor,actionLabel:'undo',labelColor:Colors.black);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                })
                    :
                setState(() {
                  final snackBar = SnackBarTemp.snackBarTemplate(content:'Item removed from your watchlist', backgroundColor:AppColors.yellowColor,actionLabel:'undo',labelColor:Colors.black);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                });
              },
              child:
              isSelected == true?
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
                  :
              Stack(
                  children: [
                    Image.asset('assets/images/bookmark.png',color:AppColors.bookmarkColor),
                    Positioned(
                        top:9.03.h,
                        left:7.98.w,
                        bottom:15.93.h,
                        right:7.98.w,
                        child: Image.asset('assets/images/add.png',color:Colors.white)),
                  ]
              )

          )

        ]
    );
  }
}
