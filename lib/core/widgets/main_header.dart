import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthcare_app/core/constants/app_images.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    super.key,
    required this.title,
    required this.onBackButtonPressed,
  });

  final String title;
  final void Function() onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: onBackButtonPressed,
                  child: SvgPicture.asset(
                    AppImages.backIconSvg,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
