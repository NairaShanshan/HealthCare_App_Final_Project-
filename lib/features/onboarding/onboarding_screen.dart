import 'package:flutter/material.dart';

import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';
import 'package:healthcare_app/features/onboarding/widget/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  final String image;
  final String title;

  OnBoardingModel({
    required this.image,
    required this.title,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageViewController = PageController();

  final List<OnBoardingModel> onboarding = [
    OnBoardingModel(
        image: AppImages.onboarding1,
        title: 'Find a lot of specialist doctors in one place. '),
    OnBoardingModel(
        image: AppImages.onboarding2,
        title: 'Get advice only from a doctor you believe in. '),
  ];

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
      //       // loginScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {
                      submit();
                    },
                    child: Text(
                      'Skip',
                      style: TextStyles.textStyles16
                          .copyWith(color: AppColors.greyColor),
                    )),
              ),
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
                        isLastBoarding == true;
                      });
                    } else {
                      setState(() {
                        isLastBoarding == false;
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
      ),
    );
  }
}
