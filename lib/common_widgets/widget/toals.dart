import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constants/theme/pallete.dart';

void toalsErr(BuildContext context, String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 15,
    gravity: ToastGravity.TOP_RIGHT,
    backgroundColor: Palette.redColor,
    textColor: Palette.whiteColor,
  );
}

void toalsSuccess(BuildContext context, String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 15,
    gravity: ToastGravity.TOP_RIGHT,
    backgroundColor: Palette.greenColor,
    textColor: Palette.whiteColor,
  );
}
