import 'package:json_annotation/json_annotation.dart';

part 'recipe_details_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeDetailsResponseModel {
  final bool success;
  final RecipeDetailsData? data;
  final String? error;

  RecipeDetailsResponseModel({
    required this.success,
    this.data,
    this.error,
  });

  factory RecipeDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDetailsResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RecipeDetailsData {
  final int id;
  final String name;
  final String description;
  final String image;
  final String creatorName;
  final String creatorImage;
  final bool isFeatured;
  final AdditionalInfo? additionalInfo;
  final List<ProductItem> listProducts;
  final List<StepItem> steps;
  final List<CategoryItem> categories;

  RecipeDetailsData({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.creatorName,
    required this.creatorImage,
    required this.isFeatured,
    this.additionalInfo,
    required this.listProducts,
    required this.steps,
    required this.categories,
  });

  factory RecipeDetailsData.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDetailsDataToJson(this);
}

@JsonSerializable()
class AdditionalInfo {
  final int id;
  final int time;
  final String? videoLink;

  AdditionalInfo({
    required this.id,
    required this.time,
    this.videoLink,
  });

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$AdditionalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductItem {
  final int quantity;
  final bool isFeatured;
  final Product product;

  ProductItem({
    required this.quantity,
    required this.isFeatured,
    required this.product,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}

@JsonSerializable()
class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final bool inStock;
  final String unit;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.inStock,
    required this.unit,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class StepItem {
  final int stepNum;
  final String description;
  final String? image;

  StepItem({
    required this.stepNum,
    required this.description,
    this.image,
  });

  factory StepItem.fromJson(Map<String, dynamic> json) =>
      _$StepItemFromJson(json);

  Map<String, dynamic> toJson() => _$StepItemToJson(this);
}

@JsonSerializable()
class CategoryItem {
  final String id;
  final String name;

  CategoryItem({
    required this.id,
    required this.name,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}
