import '../../../core/constants/app_images.dart';

class OnBoardingModel {
  final String image;
  final String title;

  OnBoardingModel({
    required this.image,
    required this.title,
  });
}


 List<OnBoardingModel> onboarding = [
  OnBoardingModel(
      image: AppImages.onboarding1,
      title: 'Find a lot of specialist doctors in one place. '),
  OnBoardingModel(
      image: AppImages.onboarding2,
      title: 'Get advice only from a doctor you believe in. '),
];