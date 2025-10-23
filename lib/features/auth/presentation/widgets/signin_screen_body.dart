import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/widgets/main_button.dart';
import 'package:healthcare_app/core/widgets/main_header.dart';
import 'package:healthcare_app/core/widgets/main_text_form_field.dart';
import 'package:healthcare_app/features/auth/presentation/widgets/signin_or_signup.dart';
import 'package:healthcare_app/features/auth/presentation/widgets/social_button.dart';

class SigninScreenBody extends StatefulWidget {
  const SigninScreenBody({
    super.key,
  });

  @override
  State<SigninScreenBody> createState() => _SigninScreenBodyState();
}

class _SigninScreenBodyState extends State<SigninScreenBody> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    IconData icon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              MainHeader(
                title: 'Sing In',
                onBackButtonPressed: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              MainTextFormField(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                prefixIcon: SvgPicture.asset(
                  AppImages.emailIconSvg,
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              MainTextFormField(
                hintText: 'Enter your password',
                textInputType: TextInputType.visiblePassword,
                prefixIcon: SvgPicture.asset(
                  AppImages.passwordIconSvg,
                  width: 24,
                  height: 24,
                ),
                isPassword: isPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  icon: Icon(
                    icon,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              _forgetPassword(),
              const SizedBox(
                height: 44,
              ),
              MainButton(
                text: 'Sign In',
                onPressed: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              SigninOrSignup(
                firstText: "Don't have an account? ",
                secondText: 'Sign up',
                navigateTo: () {
                  pushTo (context:  context,path:  Routes.signup);
                },
              ),
              const SizedBox(
                height: 44,
              ),
              const LoginMethodsDividerView(),
              const SizedBox(
                height: 24,
              ),
              SocialButton(
                label: 'Sign in with Google',
                image: AppImages.googleIconSvg,
                onTap: () {},
              ),
              const SizedBox(
                height: 24,
              ),
              SocialButton(
                label: 'Sign in with Facebook',
                image: AppImages.facebookIconSvg,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _forgetPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forget password?',
          style: TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}

class LoginMethodsDividerView extends StatelessWidget {
  const LoginMethodsDividerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(color: AppColors.borderColor, height: 1),
        ),
        SizedBox(width: 16),
        Text(
          'OR',
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Divider(color: AppColors.borderColor, height: 1),
        ),
      ],
    );
  }
}
