import 'package:flutter/material.dart';

import '../../../domain/entities/RecipeDetailsEntity.dart';

Widget buildIngredientItem(int index, ProductEntity product) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.green.shade100,
          child: Text(
            (index + 1).toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            "${product.name}  (${product.quantity})",
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
