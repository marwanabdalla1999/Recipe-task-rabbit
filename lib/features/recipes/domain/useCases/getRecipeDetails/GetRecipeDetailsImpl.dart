import '../../../../../core/data/utils/Result.dart';
import '../../entities/RecipeDetailsEntity.dart';
import '../../repositoriesContract/IRecipeRepository.dart';
import 'IGetRecipeDetails.dart';

class GetRecipeDetailsImpl implements IGetRecipeDetails {
  final IRecipeRepository repo;
  GetRecipeDetailsImpl(this.repo);

  @override
  Future<Result<RecipeDetailsEntity>> call(String id) => repo.getRecipeDetails(id);
}