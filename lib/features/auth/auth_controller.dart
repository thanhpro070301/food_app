import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/model/model.dart';
import 'package:food_app/repository/user/user_repository.dart';
import '../../exceptions/provider.dart';
import '../../exceptions/until.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) {
    final userRepo = ref.watch(userRepoProvider);
    return AuthController(userRepo: userRepo);
  },
);

class AuthController extends StateNotifier<bool> {
  final UserRepo _userRepo;
  AuthController({required UserRepo userRepo})
      : _userRepo = userRepo,
        super(false);

  void signUp(
      {required BuildContext context,
      required UserModel userModel,
      required WidgetRef ref}) async {
    final isEmailValid = ref.read(emailValidationProvider(userModel.email));
    if (!isEmailValid) {
      state = false;
      return;
    }

    state = true;
    final res = await _userRepo.signUp(userModel: userModel);
    state = false;
    res.fold(
      (l) => showNackBar(context, l.message),
      (r) {
        showNackBar(context, 'Account create! Please login.');
      },
    );
  }
}
