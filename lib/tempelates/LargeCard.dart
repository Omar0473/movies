import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/tempelates/app_colors.dart';
import 'package:movies/tempelates/snack_bar_temp.dart';
class LargeCards extends StatefulWidget {
  @override
  State<LargeCards> createState() => _LargeCardsState();
}
class _LargeCardsState extends State<LargeCards> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Container(
          decoration:BoxDecoration(
            color:Colors.green,
            borderRadius:BorderRadius.circular(5)
          ),
        width:129.w,
        height:199.h,
          //child:Image.asset('assets/images/testImage.png'),
      ),
        InkWell(
            splashColor:Colors.transparent,
            highlightColor:Colors.transparent,
            onTap:(){
              print("which");
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
