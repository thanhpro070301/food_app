import 'package:flutter/material.dart';

import 'theme.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF2F2F2),
    fontFamily: "Avenir",
    textTheme: textTheme(),
    primaryColor: Palette.whiteColor,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 15,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      height: 1.75,
      fontSize: 15,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 15,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 15,
    ),
  );
}
