
import 'package:equatable/equatable.dart';

abstract class RecipeDetailsEvent extends Equatable {
  const RecipeDetailsEvent();
  @override
  List<Object?> get props => [];
}

class LoadRecipeDetails extends RecipeDetailsEvent {
  final String id;
  const LoadRecipeDetails(this.id);
  @override
  List<Object?> get props => [id];
}