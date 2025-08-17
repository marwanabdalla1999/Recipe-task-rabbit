import 'package:apollo_task_flutter/features/recipes/presentation/recipeDetails/widgets/AddToCartBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/ui/skeleton/DetailsSkeleton.dart';
import '../../../../../core/presentation/ui/skeleton/SkeletonBox.dart';
import '../../../../../core/presentation/ui/theme/Styles.dart';
import '../../../data/di/Di.dart';
import 'RecipeContentSliver.dart';
import '../RecipeDetailsPage.dart';
import 'RecipeHeaderSliver.dart';
import 'RecipeOverviewSection.dart';
import '../blocs/RecipeDetailsBloc.dart';
import '../contract/RecipeDetailsEvent.dart';
import '../contract/RecipeDetailsState.dart';

class RecipeDetailsPageState extends State<RecipeDetailsPage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecipeDetailsBloc(sl())..add(LoadRecipeDetails(widget.recipeId)),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
          builder: (context, state) {
            if (state is! RecipeDetailsLoaded) return const SizedBox.shrink();
            final d = state.details;
            final itemCount = (d.products).length;
            return SafeArea(
              minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: AddToCartBar(count: itemCount, onPressed: () {}),
            );
          },
        ),
        body: BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
          builder: (context, state) {
            if (state is RecipeDetailsLoading) {
              return const DetailsSkeleton();
            }
            if (state is RecipeDetailsError) {
              return ErrorRetry(
                message: state.message,
                onRetry: () => context.read<RecipeDetailsBloc>().add(
                      LoadRecipeDetails(widget.recipeId),
                    ),
              );
            }

            final d = (state as RecipeDetailsLoaded).details;

            return CustomScrollView(
              slivers: [
                RecipeHeaderSliver(imageUrl: d.imageUrl),

                SliverToBoxAdapter(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(Styles.contentRadius)),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: RecipeOverviewSection(
                        details: d,
                        tabIndex: _tabIndex,
                        onTabChanged: (i) => setState(() => _tabIndex = i),
                      ),
                    ),
                  ),
                ),

                RecipeContentSliver(tabIndex: _tabIndex, details: d),

                const SliverToBoxAdapter(child: SizedBox(height: 96)),
              ],
            );
          },
        ),
      ),
    );
  }
}
