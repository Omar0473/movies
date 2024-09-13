import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/tempelates/app_colors.dart';
import 'package:movies/tempelates/snack_bar_temp.dart';
class Cards extends StatefulWidget {
  @override
  State<Cards> createState() => _CardsState();
}
class _CardsState extends State<Cards> {
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
                  color:Colors.blue,
                  borderRadius:BorderRadius.circular(5)
              ),
              width:96.87.w,
              height:127.74.h,
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
                  final snackBar = SnackBarTemp.SnackBarTempelate(content:'Item added to your watchlist', backgroundColor: AppColors.yellowColor,actionLabel:'undo',labelColor:Colors.black);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                })
                    :
                setState(() {
                  final snackBar = SnackBarTemp.SnackBarTempelate(content:'Item removed from your watchlist', backgroundColor:AppColors.yellowColor,actionLabel:'undo',labelColor:Colors.black);
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
