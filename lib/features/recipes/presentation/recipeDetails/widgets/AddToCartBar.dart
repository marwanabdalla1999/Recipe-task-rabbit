import 'package:flutter/material.dart';

class AddToCartBar extends StatelessWidget {
  final int count;
  final VoidCallback onPressed;
  const AddToCartBar({super.key, required this.count, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF175E44);
    const lime = Color(0xFFD9F262); // bright lime like screenshot

    return SizedBox(
      height: 64,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: lime,
          foregroundColor: green,
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        ),
        child: Row(
          children: [
            // count badge
            Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: green,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$count',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Add ingredients to cart',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Icon(Icons.shopping_bag_outlined, size: 22),
          ],
        ),
      ),
    );
  }
}