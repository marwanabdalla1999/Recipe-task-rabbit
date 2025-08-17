import '../../../../core/data/utils/Result.dart';
import '../entities/CategoryEntity.dart';
import '../entities/RecipeEntity.dart';
import '../entities/RecipeDetailsEntity.dart';

abstract class IRecipeRepository {
  Future<Result<(List<RecipeEntity>, bool)>> getRecipes({String? categoryId,required int pageNumber, int pageSize = 20});

  Future<Result<List<CategoryEntity>>> getCategories();

  Future<Result<RecipeDetailsEntity>> getRecipeDetails(String id);
}
