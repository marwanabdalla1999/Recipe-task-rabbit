import 'package:flutter/material.dart';

class TickChip extends StatelessWidget {
  const TickChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF175E44),
        borderRadius: BorderRadius.circular(13),
      ),
      child: const Icon(Icons.check_rounded, color: Colors.white, size: 16),
    );
  }
}