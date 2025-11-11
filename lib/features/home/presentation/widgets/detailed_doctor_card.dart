import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/helper/create_rating_row.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/widgets/main_button.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

class DetailedDoctorCard extends StatelessWidget {
  final String imagePath;
  final DoctorEntity doctorEntity;

  const DetailedDoctorCard({
    super.key,
    required this.imagePath,
    required this.doctorEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
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
              children: [
                Text(
                  doctorEntity.name,
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
                  doctorEntity.specialization,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.greyColor,
                  ),
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    createRatingRow(
                      context: context,
                      rating: doctorEntity.rating,
                    ),

                    // Text.rich(
                    //   textAlign: TextAlign.right,
                    //   TextSpan(children: [
                    //     TextSpan(
                    //       text: '$rating',
                    //       style: const TextStyle(
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 16,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //     const TextSpan(
                    //       text: '(2475views)',
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.w400,
                    //         fontSize: 14,
                    //         color: AppColors.greyColor,
                    //       ),
                    //     ),
                    //   ]),
                    // )
                  ],
                ),
                const Gap(10),
                MainButton(
                    borderRadius: BorderRadius.circular(3),
                    width: 150,
                    height: 33,
                    text: 'Book Now',
                    onPressed: () {
                      pushTo(
                        context: context,
                        path: Routes.doctorScreen,
                      );
                    })
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
