import 'package:flutter/material.dart';

class SegmentedPills extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;
  const SegmentedPills({required this.index, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF175E44);

    Widget pill({
      required String label,
      required bool selected,
      required VoidCallback onTap,
    }) {
      return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: selected ? green : Colors.white,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: selected ? green : Colors.black26, width: 1.2),
              boxShadow: selected
                  ? [
                BoxShadow(
                  color: green.withValues(alpha: 0.18),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ]
                  : null,
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        const SizedBox(width: 4),
        pill(label: 'Ingredients', selected: index == 0, onTap: () => onChanged(0)),
        const SizedBox(width: 12),
        pill(label: 'Instructions', selected: index == 1, onTap: () => onChanged(1)),
        const SizedBox(width: 4),
      ],
    );
  }
}