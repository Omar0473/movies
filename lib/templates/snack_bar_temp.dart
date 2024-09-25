import 'package:flutter/material.dart';

class SnackBarTemp {
  static SnackBar snackBarTemplate(
      {required String content,
      required Color backgroundColor,
      String actionLabel = '',
      Color labelColor = Colors.white,
      Function? actionsFunction}) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      //backgroundColor:Colors.transparent,
      // shape:RoundedRectangleBorder(borderRadius:BorderRadius),
      duration: const Duration(milliseconds: 900),
      content: Text(content,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
      backgroundColor: backgroundColor,
      action: SnackBarAction(
        label: actionLabel,
        textColor: labelColor,
        onPressed: () {
          actionsFunction?.call();
        },
      ),
      // AwesomeSnackbarContent(
      //   contentType:ContentType.success,
      //   message:'',
      //   title:'',
      //   color:AppColors.yellowColor,
      //
      // )
    );
  }
}
