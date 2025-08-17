import 'package:json_annotation/json_annotation.dart';

part 'recipes_response_model.g.dart';

@JsonSerializable()
class RecipesResponseModel {
  final bool success;
  final RecipeDataModel data;

  RecipesResponseModel({
    required this.success,
    required this.data,
  });

  factory RecipesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RecipesResponseModelFromJson(json);
}

@JsonSerializable()
class RecipeDataModel {
  final bool hasMore;
  final List<RecipeItemModel> items;
  final int total;
  final int pageNumber;
  final int pageSize;

  RecipeDataModel({
    required this.hasMore,
    required this.items,
    required this.total,
    required this.pageNumber,
    required this.pageSize,
  });

  factory RecipeDataModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeDataModelFromJson(json);
}

@JsonSerializable()
class RecipeItemModel {
  final int id;
  final String name;
  final String? description;
  final String? image;
  final String? creatorName;
  final String? creatorImage;
  final String? creatorLink;
  final bool isFeatured;
  final AdditionalInfoModel? additionalInfo;

  RecipeItemModel({
    required this.id,
    required this.name,
    this.description,
    this.image,
    this.creatorName,
    this.creatorImage,
    this.creatorLink,
    required this.isFeatured,
    this.additionalInfo,
  });

  factory RecipeItemModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeItemModelFromJson(json);
}

@JsonSerializable()
class AdditionalInfoModel {
  final int id;
  final int time;
  final String? videoLink;

  AdditionalInfoModel({
    required this.id,
    required this.time,
    this.videoLink,
  });

  factory AdditionalInfoModel.fromJson(Map<String, dynamic> json) =>
      _$AdditionalInfoModelFromJson(json);
}
