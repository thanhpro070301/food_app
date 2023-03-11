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
    return SizedBox(
      width: 314.w,
      height: 70.h,
      child: FloatingActionButton(
        onPressed: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: color,
        elevation: 0,
        highlightElevation: 0,
        mini: false,
        isExtended: true,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        clipBehavior: Clip.none,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 23.h),
        ),
      ),
    );
  }
}
