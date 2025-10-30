import 'package:flutter/material.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';

class PatientOptionCard extends StatelessWidget {
  final String label;
  final String? image;
  final IconData? icon;
  final bool selected;
  final VoidCallback onTap;

  const PatientOptionCard({
    super.key,
    required this.label,
    this.image,
    this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const themeColor = AppColors.primaryColor;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selected ? themeColor : Colors.grey.shade300,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyColor.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: icon != null
                ? Icon(icon, color: themeColor, size: 30)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyles.textStyles15.copyWith(
              color: selected ? themeColor : AppColors.greyColor,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
