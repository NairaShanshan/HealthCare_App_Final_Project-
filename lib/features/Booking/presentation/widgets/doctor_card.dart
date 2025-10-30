import 'package:flutter/material.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String price;
  final double rating;
  final String image;
  final bool isFavorite;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.price,
    required this.rating,
    required this.image,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.textStyles15.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  specialty,
                  style: TextStyles.textStyles15.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text('$rating', style: TextStyles.textStyles15),
                    const Spacer(),
                    Text(
                      price,
                      style: TextStyles.textStyles15.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
