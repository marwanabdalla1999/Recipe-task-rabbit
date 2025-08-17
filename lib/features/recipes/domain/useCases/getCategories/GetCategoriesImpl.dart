import 'package:apollo_task_flutter/features/recipes/domain/useCases/getCategories/IGetCategories.dart';

import '../../../../../core/data/utils/Result.dart';
import '../../entities/CategoryEntity.dart';
import '../../repositoriesContract/IRecipeRepository.dart';

class GetCategoriesImpl implements IGetCategories {
  final IRecipeRepository repo;
  GetCategoriesImpl(this.repo);

  @override
  Future<Result<List<CategoryEntity>>> call() => repo.getCategories();
}