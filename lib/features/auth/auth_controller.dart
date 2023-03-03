import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/model/model.dart';
import 'package:food_app/repository/user/user_repository.dart';
import '../../shared/core/core.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) {
    return AuthController();
  },
);

final errorProvider = StateProvider<String?>(
  (ref) {
    return null;
  },
);

class AuthController extends StateNotifier<bool> {
  AuthController() : super(false);
  UserRepo userRepo = UserRepo();

  void signUp(
      {required BuildContext context, required UserModel userModel}) async {
    // if (!isValidEmail(userModel.email)) {
    //   showNackBar(context, 'Email k hop le!!');
    //   state = false;
    //   return;
    // }
    // if (!isValidPassword(userModel.password)) {
    //   showNackBar(context, 'Pass k hop le!!');
    //   state = false;
    //   return;
    // }
    state = true;
    final res = await userRepo.signUp(userModel: userModel);
    state = false;
    res.fold(
      (l) => showNackBar(context, l.message),
      (r) {
        showNackBar(context, 'Account create! Please login.');
      },
    );
  }
}
