import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/tempelates/app_colors.dart';
import 'package:movies/tempelates/snack_bar_temp.dart';
class DetailsCard extends StatefulWidget {
  @override
  State<DetailsCard> createState() => _DetailsCardState();
}
class _DetailsCardState extends State<DetailsCard> {
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
                  color:AppColors.cardColor,
                  borderRadius:BorderRadius.circular(5)
              ),
              width:97.w,
              height:186.h,
              //child:Image.asset('assets/images/testImage.png'),
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.only(topRight:Radius.circular(5),topLeft:Radius.circular(5)),
                      color:Colors.pink
                    ),
                    height:127.74.h,
                    width:97.w,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:7,left:7),
                        child: Image.asset('assets/images/star.png'),
                      ),
                      SizedBox(width:4.96.w),
                      Padding(
                        padding: const EdgeInsets.only(top:7),
                        child: Text('0.0',style:TextStyle(color:Colors.white,fontSize:12,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  SizedBox(height:1.h),
                  Padding(
                    padding: const EdgeInsets.only(left:7),
                    child: Text('Name',style:TextStyle(color:Colors.white,fontSize:12,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis),
                  ),
                  SizedBox(height:2.h),
                  Padding(
                    padding: const EdgeInsets.only(left:7),
                    child: Text('Details',style:TextStyle(color:AppColors.descriptionColor,fontSize:10,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis),
                  )
                ],
              ),
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
