import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';
import 'package:healthcare_app/core/widgets/main_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SvgPicture.asset(AppImages.logoSvg, width: 118, height: 105),
            Gap(8),
            Text(
              "Healthcare",
              style: TextStyles.textStyles25.copyWith(
                color: AppColors.darkBlueColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(10),
            Text(
              "Let’s get started!",
              style: TextStyles.textStyles22.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Login to Stay healthy and fit ",
              style: TextStyles.textStyles16.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            Gap(50),
            MainButton(
              text: "Login",
              bgcolor: AppColors.primaryColor,
              onPressed: () {
                pushTo(context:  context,path:  Routes.signin);
              },
            ),
            Gap(15),
            MainButton(
              text: "Sign Up",
              onPressed: () {
                pushTo(context:  context,path:  Routes.signup);
              },
              borderColor: AppColors.borderColor,
              bgcolor: AppColors.backgroundColor,
              textColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
