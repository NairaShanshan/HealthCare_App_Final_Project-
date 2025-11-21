import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/article_model.dart';


class ArticleDetailsScreen extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة كبيرة
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                article.imagePath,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${article.date} • ${article.readTime}",
              style: const TextStyle(fontSize: 14, color: AppColors.greyColor),
            ),
            const SizedBox(height: 16),
            // محتوى المقال
            Text(
              article.content,
              style: const TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
