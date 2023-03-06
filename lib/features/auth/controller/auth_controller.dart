import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/common/common.dart';
import 'package:food_app/features/auth/data/repository/user_repository.dart';
import 'package:go_router/go_router.dart';
import '../data/model/user_model.dart';
import '../provider/provider.dart';

class AuthController extends StateNotifier<bool> {
  final UserRepo _userRepo;
  AuthController({required UserRepo userRepo})
      : _userRepo = userRepo,
        super(false);

  void signUp(
      {required BuildContext context,
      required UserModel userModel,
      required WidgetRef ref}) async {
    state = true;
    final res = await _userRepo.signUp(userModel: userModel);
    state = false;
    res.fold(
      (l) => toalsErr(context, l.message),
      (r) {
        toalsSuccess(context, 'Account create! Please Sign In.');
      },
    );
  }

  void signIn(
      {required BuildContext context,
      required UserModel userModel,
      required WidgetRef ref}) async {
    final isEmailValid = ref.read(emailValidationProvider(userModel.email));
    if (!isEmailValid) {
      state = false;
      return;
    }
    state = true;
    final res = await _userRepo.signIn(userModel: userModel);
    state = false;
    res.fold(
      (l) => toalsErr(context, l.message),
      (r) {
        context.go("/auth/home");
        toalsSuccess(context, 'Sign In Success');
      },
    );
  }
}
