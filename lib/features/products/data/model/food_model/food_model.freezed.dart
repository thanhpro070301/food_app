// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) {
  return _FoodModel.fromJson(json);
}

/// @nodoc
mixin _$FoodModel {
  String get foodId => throw _privateConstructorUsedError;
  String get foodName => throw _privateConstructorUsedError;
  List<ImageModel> get images => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get cateId => throw _privateConstructorUsedError;
  String get cateName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodModelCopyWith<FoodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodModelCopyWith<$Res> {
  factory $FoodModelCopyWith(FoodModel value, $Res Function(FoodModel) then) =
      _$FoodModelCopyWithImpl<$Res, FoodModel>;
  @useResult
  $Res call(
      {String foodId,
      String foodName,
      List<ImageModel> images,
      String description,
      int price,
      String cateId,
      String cateName});
}

/// @nodoc
class _$FoodModelCopyWithImpl<$Res, $Val extends FoodModel>
    implements $FoodModelCopyWith<$Res> {
  _$FoodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodId = null,
    Object? foodName = null,
    Object? images = null,
    Object? description = null,
    Object? price = null,
    Object? cateId = null,
    Object? cateName = null,
  }) {
    return _then(_value.copyWith(
      foodId: null == foodId
          ? _value.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as String,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      cateId: null == cateId
          ? _value.cateId
          : cateId // ignore: cast_nullable_to_non_nullable
              as String,
      cateName: null == cateName
          ? _value.cateName
          : cateName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FoodModelCopyWith<$Res> implements $FoodModelCopyWith<$Res> {
  factory _$$_FoodModelCopyWith(
          _$_FoodModel value, $Res Function(_$_FoodModel) then) =
      __$$_FoodModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String foodId,
      String foodName,
      List<ImageModel> images,
      String description,
      int price,
      String cateId,
      String cateName});
}

/// @nodoc
class __$$_FoodModelCopyWithImpl<$Res>
    extends _$FoodModelCopyWithImpl<$Res, _$_FoodModel>
    implements _$$_FoodModelCopyWith<$Res> {
  __$$_FoodModelCopyWithImpl(
      _$_FoodModel _value, $Res Function(_$_FoodModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodId = null,
    Object? foodName = null,
    Object? images = null,
    Object? description = null,
    Object? price = null,
    Object? cateId = null,
    Object? cateName = null,
  }) {
    return _then(_$_FoodModel(
      foodId: null == foodId
          ? _value.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as String,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      cateId: null == cateId
          ? _value.cateId
          : cateId // ignore: cast_nullable_to_non_nullable
              as String,
      cateName: null == cateName
          ? _value.cateName
          : cateName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FoodModel implements _FoodModel {
  _$_FoodModel(
      {required this.foodId,
      required this.foodName,
      required final List<ImageModel> images,
      required this.description,
      required this.price,
      required this.cateId,
      required this.cateName})
      : _images = images;

  factory _$_FoodModel.fromJson(Map<String, dynamic> json) =>
      _$$_FoodModelFromJson(json);

  @override
  final String foodId;
  @override
  final String foodName;
  final List<ImageModel> _images;
  @override
  List<ImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String description;
  @override
  final int price;
  @override
  final String cateId;
  @override
  final String cateName;

  @override
  String toString() {
    return 'FoodModel(foodId: $foodId, foodName: $foodName, images: $images, description: $description, price: $price, cateId: $cateId, cateName: $cateName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodModel &&
            (identical(other.foodId, foodId) || other.foodId == foodId) &&
            (identical(other.foodName, foodName) ||
                other.foodName == foodName) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.cateId, cateId) || other.cateId == cateId) &&
            (identical(other.cateName, cateName) ||
                other.cateName == cateName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      foodId,
      foodName,
      const DeepCollectionEquality().hash(_images),
      description,
      price,
      cateId,
      cateName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodModelCopyWith<_$_FoodModel> get copyWith =>
      __$$_FoodModelCopyWithImpl<_$_FoodModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodModelToJson(
      this,
    );
  }
}

abstract class _FoodModel implements FoodModel {
  factory _FoodModel(
      {required final String foodId,
      required final String foodName,
      required final List<ImageModel> images,
      required final String description,
      required final int price,
      required final String cateId,
      required final String cateName}) = _$_FoodModel;

  factory _FoodModel.fromJson(Map<String, dynamic> json) =
      _$_FoodModel.fromJson;

  @override
  String get foodId;
  @override
  String get foodName;
  @override
  List<ImageModel> get images;
  @override
  String get description;
  @override
  int get price;
  @override
  String get cateId;
  @override
  String get cateName;
  @override
  @JsonKey(ignore: true)
  _$$_FoodModelCopyWith<_$_FoodModel> get copyWith =>
      throw _privateConstructorUsedError;
}
