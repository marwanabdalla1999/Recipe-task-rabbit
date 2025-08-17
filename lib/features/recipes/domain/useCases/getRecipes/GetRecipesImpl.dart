import '../../../../../core/data/utils/Result.dart';
import '../../entities/RecipeEntity.dart';
import '../../repositoriesContract/IRecipeRepository.dart';
import 'IGetRecipesUseCase.dart';

class GetRecipesImpl implements IGetRecipes {
  final IRecipeRepository repository;

  GetRecipesImpl(this.repository);

  @override
  Future<Result<(List<RecipeEntity>, bool)>> call({
    String? categoryId,
    required int pageNumber,
    int pageSize = 20,
  }) {
    return repository.getRecipes(categoryId: categoryId,pageNumber: pageNumber, pageSize: pageSize);
  }
}


