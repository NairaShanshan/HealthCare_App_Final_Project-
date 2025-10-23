import 'package:flutter/material.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';

class DetailedDoctorCard extends StatelessWidget {
  final String imagePath;
  final String doctorName;
  final String specialty;

  const DetailedDoctorCard({
    super.key,
    required this.imagePath,
    required this.doctorName,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.backgroundcolor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.greyColor.withValues(alpha: .2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  doctorName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  specialty,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                ),
                const SizedBox(width: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Icon(Icons.star_border, color: Colors.amber, size: 16),
                      ],
                    ),
                  
                    Text.rich(
                      textAlign: TextAlign.right,
                      TextSpan(children: [
                        TextSpan(
                          text: '2.4',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '(2475views)',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ]),
                    )
                  ],
                )
              ],
            ),
          ),

          // 🔖 BOOKMARK ICON
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.favorite,
              color: AppColors.primaryColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
