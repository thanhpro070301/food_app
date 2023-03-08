import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoCard({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(text),
    );
  }
}


class Dividers extends StatelessWidget {
  const Dividers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.h, right: 80.h, top: 20),
      child: const Divider(
        color: Colors.white,
        height: 2,
      ),
    );
  }
}