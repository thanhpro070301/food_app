import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/constants/theme_constants/pallete.dart';

class TextSmallStyle extends StatelessWidget {
  final String text;
  final Color? color;
  const TextSmallStyle({
    super.key,
    required this.text,
    this.color = Palette.backgroundOrange1,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(color: color, fontSize: 16.h),
        recognizer: TapGestureRecognizer()..onTap = () {},
      ),
    );
  }
}
