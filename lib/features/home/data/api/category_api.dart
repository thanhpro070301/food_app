import 'package:food_app/core/exceptions/failure.dart';
import 'package:food_app/core/process/type_defs.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/network/constant/endpoints.dart';
import '../../../../core/network/dio_client.dart';

abstract class ICategoryAPI {
  FutureEither fetchCategoryAPI();
}

class CategoryAPI extends ICategoryAPI {
  final DioClient _dioClient;
  CategoryAPI({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  FutureEither fetchCategoryAPI() async {
    try {
      final res = await _dioClient.get("${Endpoints.baseUrl}/cate/list");
      return right(res.data);
    } catch (e,st) {
      return left(Failure(message: e.toString(), stackTrace: st));
    }
  }
}
