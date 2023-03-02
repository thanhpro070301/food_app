import 'package:flutter/material.dart';
import 'package:food_app/shared/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          AuthField(
            hintText: "Email address",
            controller: emailController,
          ),
          const SizedBox(height: 20),
          AuthField(
            hintText: "Password",
            controller: passwordController,
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 30),
          ButtonFoodApp(
            text: "Sign Up",
            textColor: Palette.whiteColor,
            color: Palette.backgroundOrange1,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
