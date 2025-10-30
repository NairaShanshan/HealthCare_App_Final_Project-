import 'package:flutter/material.dart';

import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';
import 'package:healthcare_app/features/onboarding/widget/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'model/onboarding_model.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageViewController = PageController();



  bool isLastBoarding = false;

  // void submit() {
  //   SharedPref.setData('onboarding', true).then((value) {
  //     if (value == true) {
  //       // loginScreen
  //     }
  //   });
  // }

  void submit() {
    if (isLastBoarding == true) {
      pushReplacement(context, Routes.welcome) ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        actions: [
          TextButton(
              onPressed: () {
                //submit();
                pushToBase(context, Routes.main) ;
              },
              child: Text(
                'Skip',
                style: TextStyles.textStyles16
                    .copyWith(color: AppColors.greyColor),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5 , left: 20 , right: 20 , bottom: 10),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageViewController,
                itemCount: onboarding.length,
                itemBuilder: (context, index) {
                  return OnBoardingItem(model: onboarding[index]);
                },
                onPageChanged: (int index) {
                  if (index == onboarding.length - 1) {
                    setState(() {
                      isLastBoarding = true;
                    });
                  } else {
                    setState(() {
                      isLastBoarding = false;
                    });
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageViewController,
                  count: onboarding.length,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primaryColor, dotWidth: 14),
                ),
                GestureDetector(
                  onTap: () {
                    if (isLastBoarding == true) {
                      submit();
                    } else {
                      pageViewController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      Icons.arrow_forward_outlined,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
