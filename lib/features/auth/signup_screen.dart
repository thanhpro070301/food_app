import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/shared/common/loading_page.dart';
import '../.././shared/shared.dart';
import '../../model/model.dart';
import 'auth_controller.dart';

final signupScreenProvider = StateProvider(
  (ref) {},
);

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    fullnameController.dispose();
    phoneController.dispose();
  }

  void onSignUp() {
    final UserModel userModel = UserModel(
      fullName: fullnameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      address: addressController.text,
    );
    ref.read(authControllerProvider.notifier).signUp(
          userModel: userModel,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return isLoading
        ? const Loader()
        : SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                AuthField(
                  label: "Email",
                  controller: emailController,
                ),
                const SizedBox(height: 10),
                AuthField(
                  label: "Password",
                  controller: passwordController,
                ),
                const SizedBox(height: 10),
                AuthField(
                  label: "Full name",
                  controller: fullnameController,
                ),
                const SizedBox(height: 20),
                AuthField(
                  label: "Phone",
                  controller: phoneController,
                ),
                AuthField(
                  label: "Address",
                  controller: addressController,
                ),
                const SizedBox(height: 40),
                ButtonFoodApp(
                  text: "Sign Up",
                  textColor: Palette.whiteColor,
                  color: Palette.backgroundOrange1,
                  onTap: onSignUp,
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
  }
}
