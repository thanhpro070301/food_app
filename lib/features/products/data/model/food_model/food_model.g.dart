// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodModel _$$_FoodModelFromJson(Map<String, dynamic> json) => _$_FoodModel(
      foodId: json['foodId'] as String,
      foodName: json['foodName'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
      price: json['price'] as int,
      cateId: json['cateId'] as String,
      cateName: json['cateName'] as String,
    );

Map<String, dynamic> _$$_FoodModelToJson(_$_FoodModel instance) =>
    <String, dynamic>{
      'foodId': instance.foodId,
      'foodName': instance.foodName,
      'images': instance.images,
      'description': instance.description,
      'price': instance.price,
      'cateId': instance.cateId,
      'cateName': instance.cateName,
    };
