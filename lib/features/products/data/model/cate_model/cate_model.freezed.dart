// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CateModel _$CateModelFromJson(Map<String, dynamic> json) {
  return _CateModel.fromJson(json);
}

/// @nodoc
mixin _$CateModel {
  String get cateId => throw _privateConstructorUsedError;
  String get cateName => throw _privateConstructorUsedError;
  String get cateImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CateModelCopyWith<CateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CateModelCopyWith<$Res> {
  factory $CateModelCopyWith(CateModel value, $Res Function(CateModel) then) =
      _$CateModelCopyWithImpl<$Res, CateModel>;
  @useResult
  $Res call({String cateId, String cateName, String cateImage});
}

/// @nodoc
class _$CateModelCopyWithImpl<$Res, $Val extends CateModel>
    implements $CateModelCopyWith<$Res> {
  _$CateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cateId = null,
    Object? cateName = null,
    Object? cateImage = null,
  }) {
    return _then(_value.copyWith(
      cateId: null == cateId
          ? _value.cateId
          : cateId // ignore: cast_nullable_to_non_nullable
              as String,
      cateName: null == cateName
          ? _value.cateName
          : cateName // ignore: cast_nullable_to_non_nullable
              as String,
      cateImage: null == cateImage
          ? _value.cateImage
          : cateImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CateModelCopyWith<$Res> implements $CateModelCopyWith<$Res> {
  factory _$$_CateModelCopyWith(
          _$_CateModel value, $Res Function(_$_CateModel) then) =
      __$$_CateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cateId, String cateName, String cateImage});
}

/// @nodoc
class __$$_CateModelCopyWithImpl<$Res>
    extends _$CateModelCopyWithImpl<$Res, _$_CateModel>
    implements _$$_CateModelCopyWith<$Res> {
  __$$_CateModelCopyWithImpl(
      _$_CateModel _value, $Res Function(_$_CateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cateId = null,
    Object? cateName = null,
    Object? cateImage = null,
  }) {
    return _then(_$_CateModel(
      cateId: null == cateId
          ? _value.cateId
          : cateId // ignore: cast_nullable_to_non_nullable
              as String,
      cateName: null == cateName
          ? _value.cateName
          : cateName // ignore: cast_nullable_to_non_nullable
              as String,
      cateImage: null == cateImage
          ? _value.cateImage
          : cateImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CateModel implements _CateModel {
  _$_CateModel(
      {required this.cateId, required this.cateName, required this.cateImage});

  factory _$_CateModel.fromJson(Map<String, dynamic> json) =>
      _$$_CateModelFromJson(json);

  @override
  final String cateId;
  @override
  final String cateName;
  @override
  final String cateImage;

  @override
  String toString() {
    return 'CateModel(cateId: $cateId, cateName: $cateName, cateImage: $cateImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CateModel &&
            (identical(other.cateId, cateId) || other.cateId == cateId) &&
            (identical(other.cateName, cateName) ||
                other.cateName == cateName) &&
            (identical(other.cateImage, cateImage) ||
                other.cateImage == cateImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cateId, cateName, cateImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CateModelCopyWith<_$_CateModel> get copyWith =>
      __$$_CateModelCopyWithImpl<_$_CateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CateModelToJson(
      this,
    );
  }
}

abstract class _CateModel implements CateModel {
  factory _CateModel(
      {required final String cateId,
      required final String cateName,
      required final String cateImage}) = _$_CateModel;

  factory _CateModel.fromJson(Map<String, dynamic> json) =
      _$_CateModel.fromJson;

  @override
  String get cateId;
  @override
  String get cateName;
  @override
  String get cateImage;
  @override
  @JsonKey(ignore: true)
  _$$_CateModelCopyWith<_$_CateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
