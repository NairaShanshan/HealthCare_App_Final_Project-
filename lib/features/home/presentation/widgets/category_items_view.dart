import 'package:flutter/material.dart';

class CategoryItemsView extends StatelessWidget {
  const CategoryItemsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(right: 16),
        child: CategoryItem(
          backgroundColor: Colors.red,
          icon: Icons.icecream_outlined,
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.backgroundColor,
    required this.icon,
  });
  final Color backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final Color lighter = backgroundColor.withValues(alpha: .9);
    final Color darker = backgroundColor.withValues(alpha: .7);

    return Container(
      width: 80,
      height: 90,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [lighter, darker],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 45,
          color: Colors.white,
        ),
      ),
    );
  }
}
