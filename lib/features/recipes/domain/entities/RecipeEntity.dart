class RecipeEntity {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final bool spotlight;
  final String chefName;
  final String chefAvatarUrl;
  final int prepMinutes;
  final String? videoUrl;

  RecipeEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.spotlight,
    required this.chefName,
    required this.chefAvatarUrl,
    required this.prepMinutes,
    this.videoUrl,
  });
}

