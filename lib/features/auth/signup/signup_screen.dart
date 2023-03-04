import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common_widgets/common.dart';
import '../../../constants/theme/theme.dart';
import '../../../provider/provider.dart';
import '../../../model/model.dart';
import '../auth_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

    fullnameController.dispose();
    phoneController.dispose();
  }

  void onSignUp() {
    final UserModel userModel = UserModel(
      fullName: fullnameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      address: '',
    );

    final isEmailValid = ref.read(
      emailValidationProvider(emailController.text),
    );
    if (!isEmailValid) {
      Fluttertoast.showToast(
        msg: "Email error!! Please again",
        toastLength: Toast.LENGTH_LONG,
        fontSize: 15,
        gravity: ToastGravity.TOP_RIGHT,
        backgroundColor: Palette.redColor,
        textColor: Palette.whiteColor,
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
                const SizedBox(
                  height: 20,
                ),
                AuthField(
                  label: "Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthFieldPass(
                  label: "Password",
                  controller: passwordController,
                ),
                const SizedBox(height: 10),
                AuthField(
                  label: "Full name",
                  controller: fullnameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthField(
                  label: "Phone",
                  controller: phoneController,
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonFoodApp(
                  text: "Sign Up",
                  textColor: Palette.whiteColor,
                  color: Palette.backgroundOrange1,
                  onTap: onSignUp,
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
  }
}
