

import '../../domain/entities/CategoryEntity.dart';
import '../responses/categories_response_model.dart';

extension CategoryMapper on CategoryItemModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
    );
  }
}

extension CategoriesListMapper on List<CategoryItemModel> {
  List<CategoryEntity> toEntities() => map((c) => c.toEntity()).toList();
}
