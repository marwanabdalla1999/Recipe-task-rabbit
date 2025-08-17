import 'package:flutter/cupertino.dart';

import '../../../../../core/presentation/ui/widgets/ingredientTile.dart';

class IngredientsSliverList extends StatelessWidget {
  final List products; // List<ProductEntity>
  const IngredientsSliverList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: products.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) {
        final p = products[i];
        return ingredientTile(context, i, p);
      },
    );
  }


}