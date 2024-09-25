import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Api/end_points.dart';
import 'package:movies/templates/snack_bar_temp.dart';
import 'app_colors.dart';

class SimilarMovieCard extends StatefulWidget {
  String imagePath;
  String title;
  int    rating;
  String details;
  SimilarMovieCard({super.key, required this.imagePath,required this.title,required this.rating,required this.details});
  @override
  State<SimilarMovieCard> createState() => _SimilarMovieCardState();
}
class _SimilarMovieCardState extends State<SimilarMovieCard> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      color:AppColors.sectionsColor,
                    ),
                    height: MediaQuery.of(context).size.height * 0.13, // It uses %13 DONT CHANGE IT NIGGA
                    width: MediaQuery.of(context).size.width * 0.25, // It uses %25 DONT CHANGE IT NIGGA
                    child:ClipRRect(
                      borderRadius:BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl:'${EndPoints.imagePath}${widget.imagePath}',

                        errorWidget:(context,url,error)=>Icon(Icons.error_outline_sharp,color:AppColors.yellowColor),
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: AppColors.yellowColor,
                          ),
                        ),
                        fit:BoxFit.fill,

                      ),
                    ),
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
                        child: Text('${widget.rating?.toStringAsFixed(1)}',style:TextStyle(color:Colors.white,fontSize:12,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  SizedBox(height:1.h),
                  Padding(
                    padding: const EdgeInsets.only(left:7),
                    child: Text('${widget.title??''}',style:TextStyle(color:Colors.white,fontSize:12,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis,maxLines:2),
                  ),
                  SizedBox(height:2.h),
                  Padding(
                    padding: const EdgeInsets.only(left:7),
                    child: Text('${widget.details}',style:TextStyle(color:AppColors.descriptionColor,fontSize:10,fontWeight:FontWeight.normal),overflow:TextOverflow.ellipsis),
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
//String imagePath;
//   String title;
//   int rating;
//   String details;
//   SimilarCards({required this.imagePath,required this.title,required this.rating,required this.details});