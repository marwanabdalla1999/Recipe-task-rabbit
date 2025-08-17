import 'package:apollo_task_flutter/features/recipes/data/dataSource/remoteDataSource/IRecipeRemoteDataSource.dart';
import 'package:apollo_task_flutter/features/recipes/data/responses/categories_response_model.dart';
import 'package:apollo_task_flutter/features/recipes/data/responses/recipe_details_response_model.dart';
import 'package:dio/dio.dart';
import '../../../../../core/data/error/Failure.dart';
import '../../../../../core/data/utils/Result.dart';
import '../../responses/recipes_response_model.dart';

class RecipeRemoteDataSourceImpl implements IRecipeRemoteDataSource{
  final Dio dio;

  RecipeRemoteDataSourceImpl(this.dio);


  @override
  Future<Result<RecipesResponseModel>> getRecipes({
    int pageNumber = 1,
    int pageSize = 20,
    String? categoryId,
  }) async {
    try {
      final res = await dio.get(
        'https://mocki.io/v1/6b2ffb2c-e143-4bf1-94fa-d43da8a33111',
        queryParameters: {
          'pageNumber': pageNumber,
          'pageSize': pageSize,
          if (categoryId != null) 'categoryId': categoryId,
        },
      );

      final response = RecipesResponseModel.fromJson(res.data);
      return Ok(response);
    } catch (e) {
      return const Err(NetworkFailure('Failed to load recipes'));
    }
  }


  @override
  Future<Result<CategoriesResponseModel>> getCategories() async {
    try {
      final res = await dio.get(
        'https://mocki.io/v1/00bc95d2-5706-4b08-91b4-5ca00bdb78c7',
      );
      final categories = CategoriesResponseModel.fromJson(res.data);
      return Ok(categories);

    } catch (_) {
      return const Err(NetworkFailure('Failed to load categories'));
    }
  }


  @override
  Future<Result<RecipeDetailsResponseModel>> getRecipeDetails(String id) async {
    try {
      // If API needs query param or path interpolation, adjust:
      final res = await dio.get(
        'https://mocki.io/v1/3ca54879-2bb8-4d35-b2bb-77c95a15012a',
        queryParameters: {'id': id},
      );
      return Ok(RecipeDetailsResponseModel.fromJson(res.data));
    } catch (_) {
      return const Err(NetworkFailure('Failed to load recipe details'));
    }
  }
}
