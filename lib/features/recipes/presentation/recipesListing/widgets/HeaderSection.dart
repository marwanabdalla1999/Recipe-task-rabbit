import 'package:apollo_task_flutter/features/recipes/presentation/recipesListing/widgets/TopHeader.dart';
import 'package:flutter/cupertino.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const TopHeader(
      title: 'Rabbit Recipes',
      subtitle: 'Get it fast, make it faster!',
      avatarUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKJ5uQRb18m2K2LdGYlzVHbF2cYo25Y4uZSg&s',
    );
  }
}