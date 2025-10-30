import 'package:flutter/material.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const themeColor = AppColors.primaryColor;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor,
          disabledBackgroundColor: Colors.grey.shade300,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyles.textStyles16.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
