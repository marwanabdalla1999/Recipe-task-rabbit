
import 'package:equatable/equatable.dart';

import '../../../domain/entities/RecipeDetailsEntity.dart';

abstract class RecipeDetailsState extends Equatable {
  const RecipeDetailsState();
  @override
  List<Object?> get props => [];
}

class RecipeDetailsLoading extends RecipeDetailsState {}

class RecipeDetailsLoaded extends RecipeDetailsState {
  final RecipeDetailsEntity details;
  const RecipeDetailsLoaded(this.details);
  @override
  List<Object?> get props => [details];
}

class RecipeDetailsError extends RecipeDetailsState {
  final String message;
  const RecipeDetailsError(this.message);
  @override
  List<Object?> get props => [message];
}