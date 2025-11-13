import 'package:flutter/material.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/features/home/presentation/widgets/articale_card.dart';

class HealthArticalView extends StatelessWidget {
  const HealthArticalView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics:const  NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: ArticleCard(
          imagePath: AppImages.doctorOne,
          title:
              'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
          date: 'Jun 10, 2023',
          readTime: '5min read',
        ),
      ),
    );
  }
}
