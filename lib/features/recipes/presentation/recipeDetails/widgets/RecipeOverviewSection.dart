import 'package:apollo_task_flutter/features/recipes/presentation/recipeDetails/widgets/SegmentedPills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/presentation/ui/theme/Styles.dart';

class RecipeOverviewSection extends StatelessWidget {
  final dynamic details;
  final int tabIndex;
  final ValueChanged<int> onTabChanged;

  const RecipeOverviewSection({
    super.key,
    required this.details,
    required this.tabIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Spotlight pill
        Row(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Styles.spotlightBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.bolt_rounded, size: 16, color: Styles.spotlightText),
                SizedBox(width: 6),
                Text(
                  'Spotlight',
                  style: TextStyle(color: Styles.spotlightText, fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ],
            ),
          ),
        ]),
        const SizedBox(height: 10),

        // Title
        Text(
          details.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, height: 1.15, color: Colors.black),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 16, backgroundImage: NetworkImage(details.chefAvatarUrl)),
            const SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Prepared by', style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w500)),
              Text(details.chefName, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87), overflow: TextOverflow.ellipsis),
            ]),
            const SizedBox(width: 8),
            const Icon(Icons.open_in_new_rounded, size: 16, color: Colors.black54),
            const Spacer(),
            const Icon(Icons.access_time, size: 18, color: Colors.black54),
            const SizedBox(width: 6),
            Text('${details.prepMinutes} mins', style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 20),
        SegmentedPills(index: tabIndex, onChanged: onTabChanged),
        const SizedBox(height: 12),
      ],
    );
  }
}