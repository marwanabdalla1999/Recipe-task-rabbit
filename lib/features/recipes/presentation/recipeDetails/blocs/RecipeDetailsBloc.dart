import 'package:apollo_task_flutter/features/recipes/domain/useCases/getRecipeDetails/IGetRecipeDetails.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/data/utils/Result.dart';
import '../../../domain/entities/RecipeDetailsEntity.dart';
import '../contract/RecipeDetailsEvent.dart';
import '../contract/RecipeDetailsState.dart';



class RecipeDetailsBloc extends Bloc<RecipeDetailsEvent, RecipeDetailsState> {
  final IGetRecipeDetails getRecipeDetails;

  RecipeDetailsBloc(this.getRecipeDetails) : super(RecipeDetailsLoading()) {
    on<LoadRecipeDetails>((event, emit) async {
      emit(RecipeDetailsLoading());
      final result = await getRecipeDetails(event.id);
      if (result is Ok<RecipeDetailsEntity>) {
        emit(RecipeDetailsLoaded(result.value));
      } else if (result is Err<RecipeDetailsEntity>) {
        emit(RecipeDetailsError(result.failure.message));
      }
    });
  }
}
