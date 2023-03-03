import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/utils/core.dart';
import '../network/network.dart';

final dioProvider = Provider(
  (ref) {
    Dio dio = FoodClient().dioInstance();
    return dio;
  },
);

final emailValidationProvider = Provider.autoDispose.family<bool, String>(
  (ref, email) {
    return isValidEmail(email);
  },
);
