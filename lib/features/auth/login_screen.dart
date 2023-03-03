import 'package:flutter/gestures.dart';
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
      child: SizedBox(
        child: Column(
          children: [
            const SizedBox(height: 70),
            AuthField(
              label: "Email address",
              controller: emailController,
            ),
            const SizedBox(height: 30),
            AuthField(
              label: "Password",
              controller: passwordController,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Forgot password?",
                      style: const TextStyle(
                          color: Palette.backgroundOrange1, fontSize: 15),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ButtonFoodApp(
              text: "Sign Up",
              textColor: Palette.whiteColor,
              color: Palette.backgroundOrange1,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
