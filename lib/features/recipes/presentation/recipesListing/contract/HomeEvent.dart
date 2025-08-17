import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

// Initial load: categories + first page of recipes
class LoadHome extends HomeEvent {}

// Load more recipes (pagination)
class LoadMoreRecipes extends HomeEvent {}

// When user selects a category
class SelectCategory extends HomeEvent {
  final String categoryId;

  const SelectCategory(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}
