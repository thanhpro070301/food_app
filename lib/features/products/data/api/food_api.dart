import 'package:food_app/core/exceptions/failure.dart';
import 'package:food_app/core/process/type_defs.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/network/constant/endpoints.dart';
import '../../../../core/network/dio_client.dart';

abstract class IFoodAPI {
  FutureEither fetchFoodAPI();
}

class FoodAPI extends IFoodAPI {
  final DioClient _dioClient;
  FoodAPI({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  FutureEither fetchFoodAPI() async {
    try {
      final res = await _dioClient.get("${Endpoints.baseUrl}/food/list");
      return right(res.data);
    } catch (e,st) {
      return left(Failure(message: e.toString(), stackTrace: st));
    }
  }
}
