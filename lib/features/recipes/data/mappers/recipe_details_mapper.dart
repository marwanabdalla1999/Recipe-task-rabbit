

import '../../domain/entities/RecipeDetailsEntity.dart';
import '../responses/recipe_details_response_model.dart';

extension RecipeDetailsMapper on RecipeDetailsData? {
  RecipeDetailsEntity toEntity() {
    return RecipeDetailsEntity(
      id: this?.id.toString()??'',
      title: this?.name??'',
      description: this?.description??'',
      imageUrl: this?.image??'',
      chefName: this?.creatorName??'',
      chefAvatarUrl: this?.creatorImage??'',
      spotlight: this?.isFeatured??false,
      prepMinutes: this?.additionalInfo?.time ?? 0,
      videoUrl: this?.additionalInfo?.videoLink,
      products: this?.listProducts.map((p) => p.toEntity()).toList()??List.empty(),
      steps: this?.steps.map((s) => s.toEntity()).toList()??List.empty(),
      categories: this?.categories.map((c) => c.toEntity()).toList()??List.empty()
    );
  }
}

extension ProductItemMapper on ProductItem {
  ProductEntity toEntity() {
    return ProductEntity(
      id: product.id.toString(),
      name: product.name,
      imageUrl: product.imageUrl,
      price: product.price,
      inStock: product.inStock,
      unit: product.unit,
      quantity: quantity,
    );
  }
}

extension StepItemMapper on StepItem {
  StepEntity toEntity() {
    return StepEntity(
      stepNum: stepNum,
      description: description,
      image: image,
    );
  }
}

extension CategoryItemMapper on CategoryItem {
  Categories toEntity() {
    return Categories(id: id, name: name);
  }
}
