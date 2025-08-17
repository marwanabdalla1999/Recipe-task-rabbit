import 'package:apollo_task_flutter/features/recipes/domain/useCases/getCategories/IGetCategories.dart';
import 'package:apollo_task_flutter/features/recipes/domain/useCases/getRecipes/IGetRecipesUseCase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/di/Di.dart';
import 'widgets/RecipeHomeView.dart';
import 'blocs/HomeBloc.dart';
import 'contract/HomeEvent.dart';


class RecipeListPage extends StatelessWidget {
  const RecipeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(sl<IGetRecipes>(), sl<IGetCategories>())..add(LoadHome()),
      child: const RecipeHomeView(),
    );
  }
}