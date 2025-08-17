import 'package:apollo_task_flutter/core/presentation/ui/widgets/TickChip.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'SoftChip.dart';

Widget ingredientTile(BuildContext context, int index, dynamic p) {
  // ==== Adjust these getters to match your ProductEntity ==== //
  final String name = p.name.toString();
  final String qty =  p.quantity.toString();
  final String? imageUrl = p.imageUrl as String?;
  final num? price = (p.price is num) ? p.price as num : null;
  final bool isAvailable = (p.inStock ?? true) as bool;
  //final String? availabilityNote = (p.availabilityNote) as String?;
  // ========================================================== //

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5FAF7), // very light green surface
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // thumb
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: imageUrl != null && imageUrl.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 44,
                    height: 44,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 44,
                    height: 44,
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      size: 20,
                    ),
                  ),
          ),
          const SizedBox(width: 12),

          // name + qty (italic)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    height: 1.1,
                  ),
                ),
                if (qty.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      qty,
                      style: const TextStyle(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // right column: price or availability
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (price != null)
                Text(
                  '${price.toStringAsFixed(2)} EGP',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
              const SizedBox(height: 6),
              if (isAvailable)
                const TickChip()
              else
                const SoftChip(text: 'Unavailable'),
            ],
          ),
        ],
      ),
    ),
  );
}
