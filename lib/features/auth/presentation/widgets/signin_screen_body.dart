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
import 'package:healthcare_app/features/auth/presentation/widgets/social_button.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/widgets/dialogs.dart';

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
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit , AuthState>(
      listener: (context, state) {
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
                    title: 'Sing In',
                    onBackButtonPressed: () {
                      pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MainTextFormField(
                    controller: cubit.emailController,
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        AppImages.emailIconSvg,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Email';
                      } else if (!AppRegex.isEmailValid(value)) {
                        return 'Please enter a valid email.';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MainTextFormField(
                    controller: cubit.passwordController,
                    hintText: 'Enter your password',
                    textInputType: TextInputType.visiblePassword,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        AppImages.passwordIconSvg,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Password';
                      }  else {
                        return null;
                      }
                    },
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
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.login();
                      }
                    },
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
