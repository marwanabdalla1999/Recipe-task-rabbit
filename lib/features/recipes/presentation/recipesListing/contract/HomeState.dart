import 'package:equatable/equatable.dart';
import '../../../domain/entities/CategoryEntity.dart';
import '../../../domain/entities/RecipeEntity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

// Loading for the whole screen
class HomeLoading extends HomeState {}

// Loaded state: categories + recipes
class HomeLoaded extends HomeState {
  final List<CategoryEntity> categories;
  final List<RecipeEntity> recipes;
  final bool hasMore;
  final int currentPage;
  final String? selectedCategoryId; // Track selected category

  const HomeLoaded({
    required this.categories,
    required this.recipes,
    required this.hasMore,
    required this.currentPage,
    this.selectedCategoryId,
  });

  HomeLoaded copyWith({
    List<CategoryEntity>? categories,
    List<RecipeEntity>? recipes,
    bool? hasMore,
    int? currentPage,
    String? selectedCategoryId,
  }) {
    return HomeLoaded(
      categories: categories ?? this.categories,
      recipes: recipes ?? this.recipes,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
    );
  }

  @override
  List<Object?> get props =>
      [categories, recipes, hasMore, currentPage, selectedCategoryId];
}

// Error state
class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
