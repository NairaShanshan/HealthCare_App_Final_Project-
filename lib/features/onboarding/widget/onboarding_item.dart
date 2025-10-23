import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


import '../../../core/utils/text_styles.dart';
import '../model/onboarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key, required this.model});

 final  OnBoardingModel model ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          model.image , fit: BoxFit.cover,),
        const Gap(10),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            model.title,
            style: TextStyles.textStyles22,),
        ),
      ],
    );
  }
}
