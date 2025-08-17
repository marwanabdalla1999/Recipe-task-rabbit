import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/CategoryEntity.dart';
import 'CategoriesSection.dart';
import 'HeaderSection.dart';
import 'RecipesSection.dart';
import '../blocs/HomeBloc.dart';
import '../contract/HomeEvent.dart';
import '../contract/HomeState.dart';

class RecipeHomeView extends StatefulWidget {
  const RecipeHomeView({super.key});

  @override
  State<RecipeHomeView> createState() => _RecipeHomeViewState();
}

class _RecipeHomeViewState extends State<RecipeHomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      List<CategoryEntity> categoriesList = [];
      String? selectedCategoryId;

      if (state is HomeLoaded) {
        categoriesList = state.categories;
        selectedCategoryId = state.selectedCategoryId;
      }

      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const HeaderSection(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: CategoriesSection(
                  categories: categoriesList,
                  selectedCategoryId: selectedCategoryId,
                  onCategorySelected: (id) => context.read<HomeBloc>().add(SelectCategory(id)),
                ),
              ),
              Expanded(
                child: RecipesSection(scrollController: _scrollController),
              ),
            ],
          ),
        ),
      );
    });
  }
}
