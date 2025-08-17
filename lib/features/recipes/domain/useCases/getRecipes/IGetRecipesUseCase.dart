import '../../../../../core/data/utils/Result.dart';
import '../../entities/RecipeEntity.dart';

abstract class IGetRecipes {
  Future<Result<(List<RecipeEntity>, bool)>> call({
    String? categoryId,
    required int pageNumber,
    int pageSize = 20,
  });
}
