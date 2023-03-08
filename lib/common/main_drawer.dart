import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDraw extends StatelessWidget {
  const MainDraw({super.key});

  Widget buildListTitle(String title, IconData icon, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 410.h,
      child: Column(
        children: [
          Container(
            height: 120,
            color: Colors.yellow,
            width: double.infinity,
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                "Cooking up ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          buildListTitle("Meals", Icons.restaurant, () {}),
          buildListTitle("Filter", Icons.settings, () {})
        ],
      ),
    );
  }
}
