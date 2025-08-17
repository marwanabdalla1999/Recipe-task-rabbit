import 'package:apollo_task_flutter/features/recipes/data/dataSource/remoteDataSource/IRecipeRemoteDataSource.dart';
import 'package:apollo_task_flutter/features/recipes/domain/useCases/getCategories/IGetCategories.dart';
import 'package:apollo_task_flutter/features/recipes/domain/useCases/getRecipeDetails/IGetRecipeDetails.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/data/network/DioClient.dart';
import '../../domain/repositoriesContract/IRecipeRepository.dart';
import '../../domain/useCases/getCategories/GetCategoriesImpl.dart';
import '../../domain/useCases/getRecipeDetails/GetRecipeDetailsImpl.dart';
import '../../domain/useCases/getRecipes/GetRecipesImpl.dart';
import '../../domain/useCases/getRecipes/IGetRecipesUseCase.dart';
import '../dataSource/remoteDataSource/RecipeRemoteDataSourceImpl.dart';
import '../repositories/RecipeRepositoryImpl.dart';


final sl = GetIt.instance;

Future<void> initDI() async {
  final client = DioClient('');
  sl.registerLazySingleton<Dio>(() => client.dio);

  sl.registerLazySingleton<IRecipeRemoteDataSource>(() => RecipeRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<IRecipeRepository>(() => RecipeRepositoryImpl(sl()));

  sl.registerFactory<IGetRecipes>(() => GetRecipesImpl(sl()));
  sl.registerFactory<IGetCategories>(() => GetCategoriesImpl(sl()));
  sl.registerFactory<IGetRecipeDetails>(() => GetRecipeDetailsImpl(sl()));
}
