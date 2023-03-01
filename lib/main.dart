import 'package:flutter/material.dart';
import 'package:food_app/features/starteed/starteed_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StarteedScreen());
  }
}
