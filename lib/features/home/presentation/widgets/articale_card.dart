
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/article_model.dart';
import '../pages/articles_details_screen.dart';


class ArticleCard extends StatelessWidget {
  final ArticleModel article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // افتح صفحة التفاصيل ومرر الموديل كامل
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ArticleDetailsScreen(article: article),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.greyColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                article.imagePath,
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
                    article.title,
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
                        article.date,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.greyColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        article.readTime,
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
            GestureDetector(
              onTap: () {
                // هنا ممكن تضيفي لوجيك للحفظ (bookmark)
              },
              child: const Icon(
                Icons.bookmark_outline,
                color: AppColors.primaryColor,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
