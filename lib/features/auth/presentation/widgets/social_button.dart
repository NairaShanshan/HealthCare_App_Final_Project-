import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';


class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.label,
    required this.image,
    required this.onTap,
  });

  final String label;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(image),
                    ),
                    Text(label,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
              // SvgPicture.asset(image),
              // const SizedBox(
              //   width: 8,
              // ),
              // Text(label, style: TextStyles.textStyle15),
            ],
          ),
        ),
      ),
    );
  }
}
