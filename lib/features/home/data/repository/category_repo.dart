import 'package:dio/dio.dart';
import 'package:food_app/core/process/type_defs.dart';
import 'package:fpdart/fpdart.dart';

import '../api/category_api.dart';
import '../model/cate_model/cate_model.dart';

abstract class ICategoryRepository {
  void fetchCategory() {}
}

class CategoryRepository implements ICategoryRepository {
  final CategoryAPI _categoryAPI;

  CategoryRepository({required CategoryAPI categoryAPI})
      : _categoryAPI = categoryAPI;

  @override
  FutureEither<List<CateModel>> fetchCategory() async {
    try {
      final res = await _categoryAPI.fetchCategoryAPI();
      final data = res.fold(
        (failure) => throw failure, 
        (value) => value['data'] as List<dynamic>,
      );
      final cateModel = data.map((e) => CateModel.fromJson(e)).toList();
      return right(cateModel);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
