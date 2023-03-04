import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/model/model.dart';
import 'package:fpdart/fpdart.dart';
import '../../exceptions/failure.dart';
import '../../provider/provider.dart';
import '../../utils/type_defs.dart';
import 'dart:developer' as devtools show log;

final userAPIProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return UserAPI(dio: dio);
});

abstract class IUserAPI {
  FutureEither<bool> signUp({required UserModel userModel});
  FutureEither<bool> signIn({required UserModel userModel});
}

class UserAPI implements IUserAPI {
  final Dio _dio;
  UserAPI({required Dio dio}) : _dio = dio;
  @override
  FutureEither<bool> signUp({required UserModel userModel}) async {
    try {
      await _dio.post(
        '/user/sign-up',
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
      await _dio.post(
        '/user/sign-in',
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
