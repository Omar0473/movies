import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/tempelates/LargeCard.dart';
import 'package:movies/tempelates/app_colors.dart';
import 'package:movies/tempelates/category.dart';

import '../../tempelates/DetailsCard.dart';
class HomeDetails extends StatelessWidget {
  static const String routeName = 'home_details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.backGroundColor,
      appBar:AppBar(
        backgroundColor:AppColors.appBarColor,
        //leading:Icon(Icons.arrow_back_ios_new_outlined),
        title:Text('Name',style:TextStyle(fontSize:20,fontWeight:FontWeight.normal,color:Colors.white)),
        centerTitle:true,
        toolbarHeight:58.h,
      ),
      body: Container(
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Stack(
              children:[
                Container(
                decoration:BoxDecoration(
                  color:Colors.red
                ),
                height:217.h,
              ),
                Positioned(
                    top:79.h,
                    bottom:78.h,
                    right:176.w,
                    left:176.w,
                    child: Image.asset('assets/images/play.png')
                ),
      ]
            ),
            SizedBox(height:13.h),
            Padding(
              padding: const EdgeInsets.only(left:10),
              child: Text('Name',style:TextStyle(color:Colors.white,fontSize:18,fontWeight:FontWeight.normal)),
            ),
            SizedBox(height:8.h),
            Padding(
              padding: const EdgeInsets.only(left:10),
              child: Text('Description',style:TextStyle(color:AppColors.descriptionColor,fontSize:12,fontWeight:FontWeight.normal)),
            ),
            SizedBox(height:20.h),
            Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: LargeCards(),
                    ),
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width:11.w),
                            Category(label:'Action'),
                            SizedBox(width:9.w),
                            Category(label:'Action'),
                            SizedBox(width:9.w),
                            Category(label:'Action'),
                          ],
                        ),
                        SizedBox(height:41.h),
                        Padding(
                          padding: const EdgeInsets.only(left:13),
                          child: Text('Details',style:TextStyle(color:AppColors.descriptionColor,fontSize:13,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis),
                        ),
                        SizedBox(height:84.h),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:13),
                              child: Image.asset('assets/images/star.png',scale:0.555),
                            ),
                            SizedBox(width:4.96.w),
                            Text('0.0',style:TextStyle(color:Colors.white,fontSize:18,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height:42.h),
            Container(
              color:AppColors.sectionsColor,
              width:565.w,
              height:246.h,
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:16,top:10),
                    child: Text('More Like This',style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis),
                  ),
                  SizedBox(height:12.87.h),
                  Expanded(
                      child:
                      GridView.builder(
                          itemCount:10,
                          scrollDirection:Axis.horizontal,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:1,
                              crossAxisSpacing:0,
                              mainAxisExtent:125
                          ),
                          itemBuilder:(context,index){
                            return Padding(
                              padding: const EdgeInsets.only(left:16),
                              child:InkWell(
                                  splashColor:Colors.transparent,
                                  highlightColor:Colors.transparent,
                                  onTap:(){
                                    Navigator.pushNamed(context,HomeDetails.routeName);
                                    //print('pressed✔️');
                                  },
                                  child: DetailsCard()),
                            );
                          }
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
