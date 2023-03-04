import 'package:dio/dio.dart';

class FoodClient {
  static final FoodClient _instance = FoodClient._internal();
  factory FoodClient() {
    return _instance;
  }

  FoodClient._internal();

  var dio = Dio();

  void init() {
    var options = BaseOptions(
      baseUrl: 'https://food-api.huytx.com/api/v1',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    dio = Dio(options);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  Dio dioInstance() {
    return dio;
  }
}
