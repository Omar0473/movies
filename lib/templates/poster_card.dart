import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Api/end_points.dart';
import 'package:movies/templates/snack_bar_temp.dart';

import 'app_colors.dart';

class PosterCard extends StatefulWidget {
  String imagePath;

  PosterCard({required this.imagePath});

  @override
  State<PosterCard> createState() => _PosterCardState();
}

class _PosterCardState extends State<PosterCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: AppColors.sectionsColor,
            borderRadius: BorderRadius.circular(5)),
        width: 129.w,
        height: 199.h,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: '${EndPoints.imagePath}${widget.imagePath}',
              placeholder: (context, url) => Center(
                  child:
                      CircularProgressIndicator(color: AppColors.yellowColor)),
              errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error_outline_sharp,
                      color: AppColors.yellowColor)),
            )),
        //child:Image.asset('assets/images/testImage.png'),
      ),
      InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            isSelected = !isSelected;
            isSelected == true
                ? setState(() {
                    final snackBar = SnackBarTemp.snackBarTemplate(
                        content: 'Item added to your watchlist',
                        backgroundColor: AppColors.yellowColor,
                        actionLabel: 'undo',
                        labelColor: Colors.black);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  })
                : setState(() {
                    final snackBar = SnackBarTemp.snackBarTemplate(
                        content: 'Item removed from your watchlist',
                        backgroundColor: AppColors.yellowColor,
                        actionLabel: 'undo',
                        labelColor: Colors.black);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
          },
          child: isSelected == true
              ? Stack(children: [
                  Image.asset('assets/images/selectedBookmark.png',
                      color: AppColors.yellowColor),
                  Positioned(
                      top: 9.03.h,
                      left: 7.98.w,
                      bottom: 15.93.h,
                      right: 7.98.w,
                      child: Image.asset('assets/images/done.png',
                          color: Colors.white)),
                ])
              : Stack(children: [
                  Image.asset('assets/images/bookmark.png',
                      color: AppColors.bookmarkColor),
                  Positioned(
                      top: 9.03.h,
                      left: 7.98.w,
                      bottom: 15.93.h,
                      right: 7.98.w,
                      child: Image.asset('assets/images/add.png',
                          color: Colors.white)),
                ]))
    ]);
  }
}
