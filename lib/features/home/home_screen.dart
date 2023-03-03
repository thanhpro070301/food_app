import 'package:flutter/material.dart';

import '../../constants/theme/pallete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "W E L C O M E",
          style: TextStyle(color: Palette.backgroundOrange1, fontSize: 25),
        ),
      ),
    );
  }
}
