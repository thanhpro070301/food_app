import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/common_widgets/loading_page.dart';
import '../../../common_widgets/widget/auth_field.dart';
import '../../../common_widgets/widget/button_food_app.dart';
import '../../../constants/theme/pallete.dart';
import '../../../exceptions/provider.dart';
import '../../../model/model.dart';
import '../auth_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

    final isEmailValid = ref.read(
      emailValidationProvider(emailController.text),
    );
    if (!isEmailValid) {
      Fluttertoast.showToast(
        msg: "Email lỗi con mệ rồi",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }
    ref
        .read(authControllerProvider.notifier)
        .signUp(userModel: userModel, context: context, ref: ref);
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
