import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../common/common.dart';
import '../../../../common/widget/text_style.dart';
import '../../../../core/constants/theme_constants/pallete.dart';

import '../../data/model/user_model.dart';
import '../../provider/provider.dart';

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
      email: "admin900@gmail.com",
      fullName: '',
      phone: '',
      password: 'Thanh070301@',
      address: '',
    );
    final isEmailValid = ref.read(
      emailValidationProvider("admin900@gmail.com"),
    );
    if (!isEmailValid) {
      Fluttertoast.showToast(
        msg: "Email error!! Please again!!!",
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
        .signIn(userModel: userModel, context: context, ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return isLoading
        ? const Loader()
        : _bodySignIn();
  }

  SingleChildScrollView _bodySignIn() {
    return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h),
              AuthField(
                keyboardType: TextInputType.emailAddress,
                label: "Email address",
                controller: emailController,
              ),
              SizedBox(height: 30.h),
              AuthFieldPass(
                label: "Password",
                controller: passwordController,
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    TextSmallStyle(text: "Forgot password?"),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
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
