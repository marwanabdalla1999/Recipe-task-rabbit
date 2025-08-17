
import '../../domain/entities/RecipeEntity.dart';
import '../responses/recipes_response_model.dart';

extension RecipeItemMapper on RecipeItemModel {
  RecipeEntity toEntity() {
    return RecipeEntity(
      id: id.toString(),
      title: name,
      description: description ?? '',
      thumbnailUrl: image??'',
      spotlight: isFeatured,
      chefName: creatorName ?? 'Unknown',
      chefAvatarUrl: creatorImage ?? '',
      prepMinutes: additionalInfo?.time??0,
      videoUrl: additionalInfo?.videoLink??'',

    );
  }
}
