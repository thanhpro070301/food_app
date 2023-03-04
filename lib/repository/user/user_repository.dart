import 'package:food_app/repository/user/user_service.dart';
import '../../utils/type_defs.dart';
import '../../model/model.dart';

abstract class IUserRepo {
  void signUp({required UserModel userModel}) {}
  void signIn({required UserModel userModel}) {}
}

class UserRepo implements IUserRepo {
  final UserAPI _userAPI;
  UserRepo({required UserAPI userAPI}) : _userAPI = userAPI;
  @override
  FutureEither<bool> signUp({required UserModel userModel}) {
    return _userAPI.signUp(userModel: userModel);
  }

  @override
  FutureEither<bool> signIn({required UserModel userModel}) {
    return _userAPI.signIn(userModel: userModel);
  }
}
