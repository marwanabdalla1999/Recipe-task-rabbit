import 'package:apollo_task_flutter/core/presentation/ui/widgets/CategoriesBar.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/CategoryEntity.dart';


class CategoriesSection extends StatelessWidget {
  final List<CategoryEntity> categories;
  final String? selectedCategoryId;
  final void Function(String) onCategorySelected;

  const CategoriesSection({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return SizedBox(
        height: 48,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: 5,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, i) {
            final widths = [70.0, 92.0, 80.0, 96.0, 72.0];
            return Container(
              width: widths[i % widths.length],
              height: 36,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          },
        ),
      );
    }

    return SizedBox(
      height: 48,
      child: CategoriesBar(
        categories: categories,
        selectedCategoryId: selectedCategoryId,
        onCategorySelected: onCategorySelected,
      ),
    );
  }
}