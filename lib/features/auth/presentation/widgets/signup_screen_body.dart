import 'package:flutter/gestures.dart';
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

class SignupScreenBody extends StatefulWidget {
  const SignupScreenBody({
    super.key,
  });

  @override
  State<SignupScreenBody> createState() => _SignupScreenBodyState();
}

class _SignupScreenBodyState extends State<SignupScreenBody> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    IconData icon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    MainHeader(
                      title: 'Sing Up',
                      onBackButtonPressed: () {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MainTextFormField(
                      hintText: 'Enter your name',
                      textInputType: TextInputType.text,
                      prefixIcon: SvgPicture.asset(
                        AppImages.userIconSvg,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
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
                    const SizedBox(
                      height: 8,
                    ),
                    const PrivacyPolicyCheckbox(),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
             MainButton(
              text: 'Sign In',
              onPressed: (){},
            ),
            const SizedBox(
              height: 8,
            ),
            SigninOrSignup(
              firstText: "Already have an account? ",
              secondText: 'Sign In',
              navigateTo: () {
                pushTo(context, Routes.signin);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyPolicyCheckbox extends StatefulWidget {
  const PrivacyPolicyCheckbox({
    super.key,
  });

  @override
  State<PrivacyPolicyCheckbox> createState() => _PrivacyPolicyCheckboxState();
}

class _PrivacyPolicyCheckboxState extends State<PrivacyPolicyCheckbox> {
  bool isChecked = false;
  late TapGestureRecognizer _onTermsTapRecognizer;
  late TapGestureRecognizer _onPrivacyTapRecognizer;

  @override
  void initState() {
    super.initState();
    _onTermsTapRecognizer = TapGestureRecognizer()..onTap = _handlePress;
    _onPrivacyTapRecognizer = TapGestureRecognizer()..onTap = _handlePress;
  }

  @override
  void dispose() {
    _onTermsTapRecognizer.dispose();
    _onPrivacyTapRecognizer.dispose();

    super.dispose();
  }

  void _handlePress() {
    print('terms');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: isChecked,
            fillColor: isChecked
                ? WidgetStateProperty.all(AppColors.primaryColor)
                : WidgetStateProperty.all(Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: const BorderSide(width: 1.5, color: Colors.grey),
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            maxLines: 3,
            TextSpan(
              children: [
                const TextSpan(
                  text: 'I agree to the healthcare ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Terms of service ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                  recognizer: _onTermsTapRecognizer,
                ),
                const TextSpan(
                  text: 'and ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                  recognizer: _onPrivacyTapRecognizer,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
