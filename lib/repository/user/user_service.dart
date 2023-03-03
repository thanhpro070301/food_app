import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/model/model.dart';
import 'package:fpdart/fpdart.dart';
import '../../exceptions/failure.dart';
import '../../exceptions/provider.dart';
import '../../exceptions/type_defs.dart';

final userAPIProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return UserAPI(dio: dio);
});

abstract class IUserAPI {
  FutureEither<bool> signUp({required UserModel userModel});
}

class UserAPI implements IUserAPI {
  final Dio _dio;
  UserAPI({required Dio dio}) : _dio = dio;
  @override
  FutureEither<bool> signUp({required UserModel userModel}) async {
    try {
      await _dio.post(
        '/sign-up',
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
