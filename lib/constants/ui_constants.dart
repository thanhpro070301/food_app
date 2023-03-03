import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        "",
        height: 30,
      ),
      centerTitle: true,
    );
  }
}
