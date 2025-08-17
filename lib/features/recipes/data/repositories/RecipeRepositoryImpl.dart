
import 'package:apollo_task_flutter/core/data/utils/Result_ext.dart';
import 'package:apollo_task_flutter/features/recipes/data/mappers/category_mapper.dart';
import 'package:apollo_task_flutter/features/recipes/data/mappers/recipe_details_mapper.dart';
import 'package:apollo_task_flutter/features/recipes/data/mappers/recipe_mapper.dart';
import 'package:apollo_task_flutter/features/recipes/domain/entities/RecipeEntity.dart';
import 'package:apollo_task_flutter/features/recipes/domain/entities/CategoryEntity.dart';
import '../../../../core/data/utils/Result.dart';
import '../../domain/entities/RecipeDetailsEntity.dart';
import '../../domain/repositoriesContract/IRecipeRepository.dart';
import '../dataSource/remoteDataSource/IRecipeRemoteDataSource.dart';


class RecipeRepositoryImpl implements IRecipeRepository {
  final IRecipeRemoteDataSource remote;
  RecipeRepositoryImpl(this.remote);

  @override
  Future<Result<(List<RecipeEntity>, bool)>> getRecipes({
    String? categoryId,
    required int pageNumber,
    int pageSize = 20,
  }) async {
    final result = await remote.getRecipes(pageNumber: pageNumber, pageSize: pageSize,categoryId: categoryId);

    return result.when(
      ok: (response) {
        final recipes = response.data.items.map((e) => e.toEntity()).toList();
        final hasMore = response.data.hasMore;
        return Ok((recipes, hasMore));
      },
      err: (failure) => Err(failure),
    );
  }


  @override
  Future<Result<List<CategoryEntity>>> getCategories() async {
    final r = await remote.getCategories();
    return switch (r) {
      Ok(value: final categories) => Ok(categories.data.map((m) => m.toEntity()).toList()),
      Err(failure: final f) => Err(f),
    };
  }

  @override
  Future<Result<RecipeDetailsEntity>> getRecipeDetails(String id) async {
    final r = await remote.getRecipeDetails(id);
    return switch (r) {
      Ok(value: final m) => Ok(m.data.toEntity()),
      Err(failure: final f) => Err(f),
    };
  }
}
