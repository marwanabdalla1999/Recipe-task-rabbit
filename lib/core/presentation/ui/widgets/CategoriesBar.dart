import 'package:flutter/material.dart';

import '../../../../features/recipes/domain/entities/CategoryEntity.dart';

const Color _kPrimaryGreen = Color(0xFF1E8A52);

class CategoriesBar extends StatelessWidget {
  final List<CategoryEntity> categories;
  final String? selectedCategoryId;
  final Function(String) onCategorySelected;

  const CategoriesBar({super.key, required this.categories, this.selectedCategoryId, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    final cats = categories;
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cats.length,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final c = cats[i];
          final isSelected = c.id == selectedCategoryId || (selectedCategoryId == null && i == 0);
          return GestureDetector(
            onTap: () => onCategorySelected(c.id),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? _kPrimaryGreen : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey[200]!),
                boxShadow: isSelected
                    ? [
                  BoxShadow(color: _kPrimaryGreen.withValues(alpha: 0.12), blurRadius: 8, offset: const Offset(0, 3)),
                ]
                    : [
                  BoxShadow(color: Colors.black.withValues(alpha:0.02), blurRadius: 4, offset: const Offset(0, 2)),
                ],
              ),
              child: Text(
                c.name,
                style: TextStyle(
                  color: isSelected ? Colors.white : _kPrimaryGreen,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}