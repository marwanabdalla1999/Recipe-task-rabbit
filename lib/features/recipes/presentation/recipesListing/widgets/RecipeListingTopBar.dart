import 'package:flutter/material.dart';
import '../../../domain/entities/CategoryEntity.dart';
import '../../../../../core/presentation/ui/widgets/CategoriesBar.dart';

class RecipeListingTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String description;
  final String iconUrl;
  final List<CategoryEntity> categories;
  final String? selectedCategoryId;
  final Function(String categoryId) onCategorySelected;

  const RecipeListingTopBar({
    super.key,
    required this.title,
    required this.description,
    required this.iconUrl,
    required this.categories,
    this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white, // light green background
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top section: icon, title, description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(iconUrl),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Categories row
            CategoriesBar(
              categories: categories,
              selectedCategoryId: selectedCategoryId,
              onCategorySelected: onCategorySelected,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(140);
}
