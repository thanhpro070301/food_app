import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/constants/theme_constants/pallete.dart';

void toalsErr(BuildContext context, String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 19.h,
    gravity: ToastGravity.TOP_RIGHT,
    backgroundColor: Palette.redColor,
    textColor: Palette.whiteColor,
  );
}

void toalsSuccess(BuildContext context, String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 19.h,
    gravity: ToastGravity.TOP,
    backgroundColor: Colors.lightGreenAccent,
    textColor: Colors.grey[700],
  );
}
