import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;

  final String label;
  const AuthField({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 314.w,
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 18.h),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 18.h),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        ),
      ),
    );
  }
}

class AuthFieldPass extends StatefulWidget {
  final TextEditingController controller;

  final String label;
  const AuthFieldPass({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  State<AuthFieldPass> createState() => _AuthFieldPassState();
}

class _AuthFieldPassState extends State<AuthFieldPass> {
  late bool obs = true;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 314.w,
      ),
      child: TextField(
        controller: widget.controller,
        style: TextStyle(fontSize: 18.h),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 18.h),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obs = !obs;
              });
            },
            child: Icon(
              obs ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        ),
        obscureText: obs,
      ),
    );
  }
}
