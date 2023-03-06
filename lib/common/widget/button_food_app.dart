import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonFoodApp extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final VoidCallback onTap;
  const ButtonFoodApp(
      {super.key,
      required this.color,
      required this.text,
      required this.textColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          fixedSize: Size(314.w, 70.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.h))),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 23.h),
      ),
    );
  }
}
