// ignore_for_file: non_constant_identifier_names
import 'package:dio/dio.dart';
import 'package:food_app/shared/core/core.dart';
import 'package:food_app/model/model.dart';
import 'package:fpdart/fpdart.dart';
import '.././../network/network.dart';

abstract class IUserAPI {
  FutureEither<bool> signUp({required UserModel userModel});
}

class UserAPI implements IUserAPI {
  Dio dio = FoodClient().dioInstance();

  @override
  FutureEither<bool> signUp({required UserModel userModel}) async {
    try {
      await dio.post(
        '/user/sign-up',
        data: {
          'fullName': userModel.fullName,
          'email': userModel.email,
          'phone': userModel.phone,
          'password': userModel.password,
          'address': userModel.address,
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
