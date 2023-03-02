import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/model/user_model.dart';
import 'package:food_app/repository/user/user_repository.dart';
import '../../core/until.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController();
});

class AuthController extends StateNotifier<bool> {
  AuthController() : super(false);
  UserRepo userRepo = UserRepo();
  void signUp(
      {required BuildContext context, required UserModel userModel}) async {
    state = true;
    final res = await userRepo.signUp(userModel: userModel);
    state = false;
    res.fold((l) => showNackBar(context, l.message), (r) {
      showNackBar(context, 'Account create! Please login.');
    });
  }
}
