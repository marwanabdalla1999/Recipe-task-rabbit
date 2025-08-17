import '../../../../../core/data/utils/Result.dart';
import '../../entities/RecipeDetailsEntity.dart';

abstract class IGetRecipeDetails {
  Future<Result<RecipeDetailsEntity>> call(String id);
}
