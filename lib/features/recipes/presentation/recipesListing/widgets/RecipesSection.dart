import 'package:apollo_task_flutter/features/recipes/presentation/recipesListing/widgets/RecipesGrid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/ui/skeleton/RecipesGridSkeleton.dart';
import '../../../../../core/presentation/ui/skeleton/SkeletonBox.dart';
import '../blocs/HomeBloc.dart';
import '../contract/HomeEvent.dart';
import '../contract/HomeState.dart';

class RecipesSection extends StatelessWidget {
  final ScrollController scrollController;

  const RecipesSection({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        // show skeleton while initial load is happening
        return const RecipesGridSkeleton();
      }

      if (state is HomeError) {
        // central simple error + retry UI
        return Center(
          child: ErrorRetry(
            message: state.message,
            onRetry: () => context.read<HomeBloc>().add(LoadHome()),
          ),
        );
      }

      if (state is HomeLoaded) {
        return RecipesGrid(
          scrollController: scrollController,
          recipes: state.recipes,
          hasMore: state.hasMore,
        );
      }

      // fallback empty state
      return const SizedBox.shrink();
    });
  }
}