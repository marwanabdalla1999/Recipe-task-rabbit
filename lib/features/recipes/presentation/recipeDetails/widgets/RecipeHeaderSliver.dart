import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart' show StatelessWidget, BuildContext, Widget, Icon, Offset, Navigator, EdgeInsets, Padding, StackFit, ValueKey, BoxFit, Container, BoxShape, BoxShadow, BoxDecoration, Center, Alignment, LinearGradient, Stack;
import 'package:flutter/material.dart';

import '../../../../../core/presentation/ui/theme/Styles.dart';

class RecipeHeaderSliver extends StatelessWidget {
  final String imageUrl;

  const RecipeHeaderSliver({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      pinned: false,
      floating: false,
      expandedHeight: Styles.headerExpandedHeight,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(
            Icons.ios_share_outlined,
            color: Colors.white,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // network image (keyed to refresh when the url changes)
            CachedNetworkImage(
              key: ValueKey(imageUrl),
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(color: Colors.black12),
              errorWidget: (_, __, ___) => const Icon(Icons.broken_image, size: 48),
            ),

            // centered play circle
            Center(
              child: Container(
                width: Styles.playCircleSize,
                height: Styles.playCircleSize,
                decoration: BoxDecoration(
                  color: Styles.playCircleBg,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(Icons.play_arrow_rounded, size: 44, color: Colors.black),
              ),
            ),

            // top gradient to make title readable when collapsed or near the top
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black.withValues(alpha: 0.35),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}