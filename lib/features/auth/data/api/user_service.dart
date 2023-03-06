import 'package:fpdart/fpdart.dart';
import '../../../../core/exceptions/failure.dart';
import '../../../../core/network/constant/endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/process/type_defs.dart';
import 'dart:developer' as devtools show log;

import '../model/user_model.dart';

abstract class IUserAPI {
  FutureEither<bool> signUp({required UserModel userModel});
  FutureEither<bool> signIn({required UserModel userModel});
}

class UserAPI implements IUserAPI {
  final DioClient _dioClient;
  UserAPI({required DioClient dioClient}) : _dioClient = dioClient;
  @override
  FutureEither<bool> signUp({required UserModel userModel}) async {
    try {
      await _dioClient.post(
        "${Endpoints.baseUrl}/user/sign-up",
        data: {
          'fullName': userModel.fullName,
          'email': userModel.email,
          'phone': userModel.phone,
          'password': userModel.password,
        },
      );
      devtools.log("ok complete");
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

  @override
  FutureEither<bool> signIn({required UserModel userModel}) async {
    try {
      await _dioClient.post(
        "${Endpoints.baseUrl}/user/sign-in",
        data: {
          'email': userModel.email,
          'password': userModel.password,
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
