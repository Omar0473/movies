import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/tempelates/app_colors.dart';
class Category extends StatelessWidget {
  String label;
  Category({required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:65.w,
      height:30.h,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.descriptionColor,
          width:1
        )
      ),
      child:Center(child: Text('$label',style:TextStyle(color:Colors.white,fontSize:10,fontWeight:FontWeight.normal))),
    );
  }
}
