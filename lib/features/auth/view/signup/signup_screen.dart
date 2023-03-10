import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/common.dart';
import '../../../../core/constants/theme_constants/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../data/model/user_model.dart';
import '../../provider/provider.dart';

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
        fontSize: 15.h,
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
                SizedBox(
                  height: 20.h,
                ),
                AuthField(
                  keyboardType: TextInputType.emailAddress,
                  label: "Email",
                  controller: emailController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                AuthFieldPass(
                  label: "Password",
                  controller: passwordController,
                ),
                SizedBox(height: 10.h),
                AuthField(
                  keyboardType: TextInputType.name,
                  label: "Full name",
                  controller: fullnameController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                AuthField(
                  keyboardType: TextInputType.phone,
                  label: "Phone",
                  controller: phoneController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ButtonFoodApp(
                  text: "Sign Up",
                  textColor: Palette.whiteColor,
                  color: Palette.backgroundOrange1,
                  onTap: onSignUp,
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          );
  }
}
