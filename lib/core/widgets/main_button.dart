import 'package:flutter/material.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 250,
    this.height = 56,
    this.borderColor,
    this.bgcolor = AppColors.primaryColor,
    this.textColor = AppColors.backgroundColor,
  });

  final String text;
  final Function() onPressed;
  final Color bgcolor;
  final double width;
  final double height;
  final Color? borderColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color:
                borderColor != null ? AppColors.darkColor : Colors.transparent,
          ),
          backgroundColor: bgcolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.textStyles16.copyWith(color: textColor),
        ),
      ),
    );
  }
}
