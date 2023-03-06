import 'package:dio/dio.dart';
import 'package:food_app/core/process/type_defs.dart';
import 'package:food_app/features/products/data/model/food_model/food_model.dart';
import 'package:fpdart/fpdart.dart';
import '../api/food_api.dart';

abstract class IFoodRepository {
  void fetchFood() {}
}

class FoodRepository implements IFoodRepository {
  final FoodAPI _foodAPI;

  FoodRepository({required FoodAPI foodAPI}) : _foodAPI = foodAPI;

  @override
  FutureEither<List<FoodModel>> fetchFood() async {
    try {
      final res = await _foodAPI.fetchFoodAPI();
      final data = res.fold(
        (failure) => throw failure,
        (value) => value['data'] as List<dynamic>,
      );
      final foodModel = data.map((e) => FoodModel.fromJson(e)).toList();
      return right(foodModel);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
