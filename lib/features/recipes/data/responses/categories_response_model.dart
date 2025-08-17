import 'package:json_annotation/json_annotation.dart';

part 'categories_response_model.g.dart';

@JsonSerializable()
class CategoriesResponseModel {
  final bool success;
  final List<CategoryItemModel> data;

  CategoriesResponseModel({
    required this.success,
    required this.data,
  });

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);
}

@JsonSerializable()
class CategoryItemModel {
  final String id;
  final String name;

  CategoryItemModel({
    required this.id,
    required this.name,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemModelFromJson(json);
}
