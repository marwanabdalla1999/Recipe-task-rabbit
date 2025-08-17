import 'package:apollo_task_flutter/features/recipes/presentation/recipeDetails/widgets/IngredientsSliverList.dart';
import 'package:apollo_task_flutter/features/recipes/presentation/recipeDetails/widgets/StepsSliverList.dart';
import 'package:flutter/cupertino.dart';

class RecipeContentSliver extends StatelessWidget {
  final int tabIndex;
  final dynamic details;

  const RecipeContentSliver({super.key, required this.tabIndex, required this.details});

  @override
  Widget build(BuildContext context) {
    if (tabIndex == 0) {
      // ingredients present as a Sliver list in your original implementation
      return IngredientsSliverList(products: details.products);
    } else {
      return StepsSliverList(items: details.steps);
    }
  }
}