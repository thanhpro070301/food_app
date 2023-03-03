import 'package:flutter/material.dart';

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
      constraints: const BoxConstraints(
        maxWidth: 350,
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 20),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow, width: 10)),
        ),
      ),
    );
  }
}
