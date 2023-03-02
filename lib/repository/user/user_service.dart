// ignore_for_file: non_constant_identifier_names
import 'package:dio/dio.dart';
import 'package:food_app/core/failure.dart';
import 'package:food_app/model/user_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../core/type_defs.dart';

abstract class IUserAPI {
  FutureEither<bool> signUp(UserModel user);
}

class UserAPI implements IUserAPI {
  final Dio dio = Dio();
  @override
  FutureEither<bool> signUp(UserModel user) async {
    try {
      await dio.post(
        'https://food-api.huytx.com/api/v1/user/sign-up',
        data: {
          'fullName': user.fullName,
          'email': user.email,
          'phone': user.phone,
          'password': user.password,
          'address': user.address,
        },
      );
      return right(true);
    } catch (e, st) {
      return left(
        Failure(
          message: e.toString(),
          stackTrace: st,
        ),
      );
    }
  }
}
