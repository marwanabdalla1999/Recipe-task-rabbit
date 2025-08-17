import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailsSkeleton extends StatelessWidget {
  const DetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView(
        children: [
          Container(height: 260, color: Colors.white), // Image placeholder
          const SizedBox(height: 16),
          Container(height: 20, margin: const EdgeInsets.symmetric(horizontal: 16), color: Colors.white), // title
          const SizedBox(height: 8),
          Container(height: 16, margin: const EdgeInsets.symmetric(horizontal: 16), color: Colors.white), // subtitle
          const SizedBox(height: 24),
          for (int i = 0; i < 5; i++)
            Container(
              height: 14,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}
