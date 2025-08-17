import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/ui/widgets/RecipeCard.dart';
import '../blocs/HomeBloc.dart';
import '../contract/HomeEvent.dart';

class RecipesGrid extends StatelessWidget {
  final ScrollController scrollController;
  final List recipes;
  final bool hasMore;

  const RecipesGrid({super.key, required this.scrollController, required this.recipes, required this.hasMore});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >= notification.metrics.maxScrollExtent - 200 && hasMore) {
          homeBloc.add(LoadMoreRecipes());
        }
        return false;
      },
      child: GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.72,
        ),
        itemCount: hasMore ? recipes.length + 1 : recipes.length,
        itemBuilder: (_, i) {
          if (i >= recipes.length) return const Center(child: CircularProgressIndicator());
          final recipe = recipes[i];
          return RecipeCard(recipe: recipe, onTap: () => Navigator.pushNamed(context, '/details', arguments: recipe.id));
        },
      ),
    );
  }
}