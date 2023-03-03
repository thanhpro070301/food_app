import 'package:flutter/material.dart';

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
          fixedSize: const Size(314, 70),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 23),
      ),
    );
  }
}
