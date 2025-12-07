import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/widgets/main_button.dart';
import 'package:healthcare_app/core/widgets/main_header.dart';
import 'package:healthcare_app/core/widgets/main_text_form_field.dart';
import 'package:healthcare_app/features/auth/presentation/cubit/cubit.dart';
import 'package:healthcare_app/features/auth/presentation/cubit/states.dart';
import 'package:healthcare_app/features/auth/presentation/widgets/signin_or_signup.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/widgets/dialogs.dart';

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
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit,AuthState>(
      listener:  (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          pop(context);
          pushToBase(context, Routes.main);
        } else if (state is AuthErrorState) {
          pop(context);
          showMyDialog(context, state.error);
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        MainHeader(
                          title: 'Sign Up',
                          onBackButtonPressed: () {
                            pop(context);
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MainTextFormField(
                          controller: cubit.nameController,
                          hintText: 'Enter your name',
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Name';
                            }  else {
                              return null;
                            }
                          },
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              AppImages.userIconSvg,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        MainTextFormField(
                          controller: cubit.emailController,
                          hintText: 'Enter your email',
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email';
                            } else if (!AppRegex.isEmailValid(value)) {
                              return 'Please enter a valid email.';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              AppImages.emailIconSvg,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        MainTextFormField(
                          controller: cubit.passwordController,
                          hintText: 'Enter your password',
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password';
                            }  else {
                              return null;
                            }
                          },
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              AppImages.passwordIconSvg,
                              width: 24,
                              height: 24,
                            ),
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
              ),
              MainButton(
                text: 'Sign Up',
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.register();
                  }
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SigninOrSignup(
                firstText: "Already have an account? ",
                secondText: 'Sign In',
                navigateTo: () {
                  pushTo(context: context, path: Routes.signin);
                },
              ),
            ],
          ),
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
