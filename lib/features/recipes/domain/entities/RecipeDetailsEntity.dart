class RecipeDetailsEntity {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String chefName;
  final String chefAvatarUrl;
  final bool spotlight;
  final int prepMinutes;
  final String? videoUrl;
  final List<ProductEntity> products;
  final List<StepEntity> steps;
  final List<Categories> categories;

  RecipeDetailsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.chefName,
    required this.chefAvatarUrl,
    required this.spotlight,
    required this.prepMinutes,
    this.videoUrl,
    required this.products,
    required this.steps,
    required this.categories,
  });
}

class ProductEntity {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final bool inStock;
  final String unit;
  final int quantity;

  ProductEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.inStock,
    required this.unit,
    required this.quantity,
  });
}

class StepEntity {
  final int stepNum;
  final String description;
  final String? image;

  StepEntity({
    required this.stepNum,
    required this.description,
    this.image,
  });
}

class Categories {
  final String id;
  final String name;

  Categories({required this.id, required this.name});
}

