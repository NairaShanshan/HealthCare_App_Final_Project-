import 'package:flutter/material.dart';
import 'package:healthcare_app/features/home/presentation/widgets/articale_card.dart';

import '../../data/models/articles_data.dart';

class HealthArticalView extends StatelessWidget {
  const HealthArticalView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics:const  NeverScrollableScrollPhysics(),
      itemCount: articlesList.length,
      itemBuilder: (context, index) {
        final article = articlesList[index];
        return Padding(
          padding:const  EdgeInsets.only(bottom: 16),
          child: ArticleCard(
            article: article
          ),
        ) ;
      }
    );
  }
}
