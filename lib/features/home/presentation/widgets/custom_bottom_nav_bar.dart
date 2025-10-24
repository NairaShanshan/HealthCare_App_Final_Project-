
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(AppImages.homeIconSvg, 0),
          _buildNavItem(AppImages.favoriteIconSvg, 1),
          _buildNavItem(AppImages.reportIconSvg, 2),
          _buildNavItem(AppImages.profileIconSvg, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(String imagePath, int index) {
    final bool isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              imagePath,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : Colors.grey.shade500,
                BlendMode.srcIn,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}