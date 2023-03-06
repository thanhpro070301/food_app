import 'package:food_app/features/auth/data/api/user_service.dart';
import 'package:food_app/features/auth/data/model/user_model.dart';
import '../../../../core/process/type_defs.dart';

abstract class IUserRepo {
  void signUp({required UserModel userModel}) {}
  void signIn({required UserModel userModel}) {}
}

class UserRepo implements IUserRepo {
  final UserAPI _userAPI;
  UserRepo({required UserAPI userAPI}) : _userAPI = userAPI;
  @override
  FutureEither<bool> signUp({required UserModel userModel}) async {
    return await _userAPI.signUp(userModel: userModel);
  }

  @override
  FutureEither<bool> signIn({required UserModel userModel}) async {
    return await _userAPI.signIn(userModel: userModel);
  }
}
