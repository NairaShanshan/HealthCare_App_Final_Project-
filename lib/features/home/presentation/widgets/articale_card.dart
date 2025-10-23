import 'package:flutter/material.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';

class ArticleCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String readTime;

  const ArticleCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.readTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.backgroundcolor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.greyColor.withValues(alpha: .2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.greyColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      readTime,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 🔖 BOOKMARK ICON
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.bookmark_outline,
              color: AppColors.primaryColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}