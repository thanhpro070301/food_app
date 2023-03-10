import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme.dart';

ThemeData theme(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF2F2F2),
    textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
      bodyMedium: GoogleFonts.poppins(
        textStyle: textTheme.bodyMedium,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.poppins(
        textStyle: textTheme.bodyLarge,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
    ),
    primaryColor: Palette.whiteColor,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 15,
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
