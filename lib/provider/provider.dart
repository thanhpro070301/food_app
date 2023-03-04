import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/utils/core.dart';
import '../features/auth/auth_controller.dart';
import '../network/network.dart';
import '../repository/user/user_repository.dart';
import '../repository/user/user_service.dart';

final dioProvider = Provider(
  (ref) {
    Dio dio = FoodClient().dioInstance();
    return dio;
  },
);

final userAPIProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return UserAPI(dio: dio);
});

final userRepoProvider = Provider(
  (ref) {
    final userAPI = ref.watch(userAPIProvider);
    return UserRepo(userAPI: userAPI);
  },
);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) {
    final userRepo = ref.watch(userRepoProvider);
    return AuthController(userRepo: userRepo);
  },
);

final emailValidationProvider = Provider.autoDispose.family<bool, String>(
  (ref, email) {
    return isValidEmail(email);
  },
);
