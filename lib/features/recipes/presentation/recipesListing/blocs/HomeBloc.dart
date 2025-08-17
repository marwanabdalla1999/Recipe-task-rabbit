import 'dart:async';

import 'package:apollo_task_flutter/core/data/utils/Result_ext.dart';
import 'package:apollo_task_flutter/features/recipes/domain/useCases/getCategories/IGetCategories.dart';
import 'package:apollo_task_flutter/features/recipes/domain/useCases/getRecipes/IGetRecipesUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/error/Failure.dart';
import '../contract/HomeEvent.dart';
import '../contract/HomeState.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IGetRecipes getRecipes;
  final IGetCategories getCategories;

  HomeBloc(this.getRecipes, this.getCategories) : super(HomeLoading()) {
    on<LoadHome>(_onLoadRecipes);
    on<LoadMoreRecipes>(_onLoadMoreRecipes);
    on<SelectCategory>(_selectCategory);
  }

  Future<void> _onLoadRecipes(LoadHome event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    // Load categories
    final categoriesResult = await getCategories();
    // Load first page of recipes
    final recipesResult = await getRecipes(categoryId: null, pageNumber: 1);

    categoriesResult.when(
      ok: (categories) {
        recipesResult.when(
          ok: (data) {
            final (recipes, hasMore) = data;
            emit(
              HomeLoaded(
                categories: categories,
                recipes: recipes,
                hasMore: hasMore,
                currentPage: 1,
              ),
            );
          },
          err: (e) => emit(HomeError(e.toString())),
        );
      },
      err: (e) => emit(HomeError(e.toString())),
    );
  }

  Future<void> _onLoadMoreRecipes(
    LoadMoreRecipes event,
    Emitter<HomeState> emit,
  ) async {
    if (state is! HomeLoaded) return;

    final currentState = state as HomeLoaded;
    if (!currentState.hasMore) return;

    final nextPage = currentState.currentPage + 1;

    final result = await getRecipes(pageNumber: nextPage);

    result.when(
      ok: (data) {
        final (recipes, hasMore) = data;
        emit(
          currentState.copyWith(
            recipes: [...currentState.recipes, ...recipes],
            hasMore: hasMore,
            currentPage: nextPage,
          ),
        );
      },
      err: (e) {
        // Keep old state, just emit error separately
        emit(HomeError(e.toString()));
      },
    );
  }

  FutureOr<void> _selectCategory(
    SelectCategory event,
    Emitter<HomeState> emit,
  ) async {
    if (state is! HomeLoaded) return;

    final recipesResult = await getRecipes(
      categoryId: event.categoryId,
      pageNumber: 1,
    );

    recipesResult.when(
      ok: (data) {
        final (recipes, hasMore) = data;
        emit(
          HomeLoaded(
            categories: (state as HomeLoaded).categories,
            recipes: recipes,
            hasMore: hasMore,
            currentPage: 1,
            selectedCategoryId: event.categoryId,
          ),
        );
      },
      err: (Failure failure) {
        emit(HomeError(failure.toString()));
      },
    );
  }
}
