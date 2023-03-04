import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/common_widgets/widget/widget.dart';

import '../../../common_widgets/loading_page.dart';
import '../../../constants/theme/pallete.dart';
import '../../../model/user_model/user_model.dart';
import '../../../provider/provider.dart';
import '../auth_controller.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignIn() {
    final UserModel userModel = UserModel(
      email: emailController.text,
      fullName: '',
      phone: '',
      password: passwordController.text,
      address: '',
    );
    final isEmailValid = ref.read(
      emailValidationProvider(emailController.text),
    );
    if (!isEmailValid) {
      Fluttertoast.showToast(
        msg: "Email error!! Please again!!!",
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
        .signIn(userModel: userModel, context: context, ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return isLoading
        ? const Loader()
        : SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                AuthField(
                  label: "Email address",
                  controller: emailController,
                ),
                const SizedBox(height: 30),
                AuthFieldPass(
                  label: "Password",
                  controller: passwordController,
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Forgot password?",
                          style: const TextStyle(
                            color: Palette.backgroundOrange1,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                ButtonFoodApp(
                  text: "Sign In",
                  textColor: Palette.whiteColor,
                  color: Palette.backgroundOrange1,
                  onTap: onSignIn,
                ),
              ],
            ),
          );
  }
}
