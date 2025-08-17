import 'package:flutter/material.dart';

import 'features/recipes/data/di/Di.dart';
import 'features/recipes/presentation/recipeDetails/RecipeDetailsPage.dart';
import 'features/recipes/presentation/recipesListing/RecipeListPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Recipe App',
          routes: {
            '/': (_) => const RecipeListPage(),
            '/details': (ctx) {
              final id = ModalRoute
                  .of(ctx)!
                  .settings
                  .arguments as String;
              return RecipeDetailsPage(recipeId: id);
            },
          },
        );
    }
}
