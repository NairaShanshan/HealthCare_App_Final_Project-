import 'package:flutter/material.dart';

import 'package:healthcare_app/core/utils/app_colors.dart';

class SigninOrSignup extends StatelessWidget {
  const SigninOrSignup({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.navigateTo,
  });
  final String firstText;
  final String secondText;
  final void Function()? navigateTo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style:const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: navigateTo,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0), // avoid extra height/width
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            secondText,
            style:const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
