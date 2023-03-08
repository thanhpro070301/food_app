import 'package:freezed_annotation/freezed_annotation.dart';
part 'cate_model.freezed.dart';
part 'cate_model.g.dart';

@freezed
class CateModel with _$CateModel {
  factory CateModel(
      {required String cateId,
      required String cateName,
      required String cateImage}) = _CateModel;

  factory CateModel.fromJson(Map<String, dynamic> json) =>
      _$CateModelFromJson(json);
}
