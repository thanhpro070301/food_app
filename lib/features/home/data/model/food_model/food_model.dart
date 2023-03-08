import 'package:freezed_annotation/freezed_annotation.dart';

import '../image_model/image_model.dart';
part 'food_model.freezed.dart';
part 'food_model.g.dart';

@freezed
class FoodModel with _$FoodModel {
  factory FoodModel({
    required String foodId,
    required String foodName,
    required List<ImageModel> images,
    required String description,
    required final int price,
    required final String cateId,
    required final String cateName,
  }) = _FoodModel;

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
}
