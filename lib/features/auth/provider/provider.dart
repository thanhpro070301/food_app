import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/process/core.dart';
import '../../../core/shared_provider/shared_providers.dart';
import '../data/repository/user_repository.dart';
import '../data/api/user_service.dart';
import '../controller/auth_controller.dart';

final userAPIProvider = Provider<UserAPI>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return UserAPI(dioClient: dioClient);
});

final userRepoProvider = Provider<UserRepo>(
  (ref) {
    final userAPI = ref.read(userAPIProvider);
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
