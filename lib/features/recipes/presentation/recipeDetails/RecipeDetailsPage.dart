import 'package:flutter/cupertino.dart';

import 'widgets/RecipeDetailsPageState.dart';

class RecipeDetailsPage extends StatefulWidget {
  final String recipeId;

  const RecipeDetailsPage({super.key, required this.recipeId});

  @override
  State<RecipeDetailsPage> createState() => RecipeDetailsPageState();
}