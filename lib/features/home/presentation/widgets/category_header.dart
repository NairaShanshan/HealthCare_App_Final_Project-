import 'package:flutter/material.dart';

class CategorysHeader extends StatelessWidget {
  const CategorysHeader({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'See all>',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}