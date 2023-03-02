import 'package:food_app/repository/user/user_service.dart';
import '../../core/type_defs.dart';
import '../../model/user_model.dart';

abstract class IUserRepo {
  void signUp({required UserModel userModel}) {}
}

class UserRepo implements IUserRepo {
  @override
  FutureEither<bool> signUp({required UserModel userModel}) {
    final UserAPI userAPI = UserAPI();
    return userAPI.signUp(userModel);
  }
}
