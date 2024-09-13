import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/screens/home_tab/home_details.dart';
import 'package:movies/tempelates/Card.dart';
import 'package:movies/tempelates/DetailsCard.dart';
import '../../tempelates/app_colors.dart';
import '../../tempelates/LargeCard.dart';
class Home extends StatelessWidget {
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Container(
      child:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:28.h),
            Stack(
              clipBehavior:Clip.none, //allows the widget to overflow the stack => no clipping
              children: [
                Container(
                  height:217.h,
                  width:412.w,
                  color:Colors.red,
                ),
                Positioned(
                  top:79.h,
                  bottom:78.h,
                  right:176.w,
                  left:176.w,
                    child: Image.asset('assets/images/play.png')
                ),
                Positioned(
                    top:90.h,
                    left:21.w,
                    child: InkWell(
                        splashColor:Colors.transparent,
                        highlightColor:Colors.transparent,
                        onTap:(){
                          Navigator.pushNamed(context,HomeDetails.routeName);
                          //print('pressed');
                        },
                        child: LargeCards())
                ),
                Positioned(
                    top: 230.h,
                    left:164.w,
                    child: Column(
                      children: [
                        Text('Name',style:TextStyle(color:Colors.white,fontSize:14,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis),
                        SizedBox(height:10.h),
                        Text('Details',style:TextStyle(color:AppColors.descriptionColor,fontSize:12,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis)
                      ],
                    )
                )
              ],
            ),
            SizedBox(height:96.h),
            Container(
              color:AppColors.sectionsColor,
              width:420.w,
              height:187.h,
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:13,top:10),
                    child: Text('New Releases',style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis),
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
                              padding: const EdgeInsets.only(left:13),
                              child: InkWell(
                                  splashColor:Colors.transparent,
                                  highlightColor:Colors.transparent,
                                  onTap:(){
                                    Navigator.pushNamed(context,HomeDetails.routeName);
                                    //print('pressed');
                                  },
                                  child: Cards()),
                            );
                          }
                      )
                  )
                ],
              ),
            ),
            SizedBox(height:30.h),
            Container(
              color:AppColors.sectionsColor,
              width:565.w,
              height:246.h,
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:16,top:10),
                    child: Text('Recommended',style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis),
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
