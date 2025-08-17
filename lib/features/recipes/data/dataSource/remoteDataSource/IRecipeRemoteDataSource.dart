import '../../../../../core/data/utils/Result.dart';
import '../../responses/categories_response_model.dart';
import '../../responses/recipe_details_response_model.dart';
import '../../responses/recipes_response_model.dart';

abstract class IRecipeRemoteDataSource{

  Future<Result<RecipesResponseModel>> getRecipes({
    int pageNumber = 1,
    int pageSize = 20,
    String? categoryId,
  });

  Future<Result<CategoriesResponseModel>> getCategories();


  Future<Result<RecipeDetailsResponseModel>> getRecipeDetails(String id);


}