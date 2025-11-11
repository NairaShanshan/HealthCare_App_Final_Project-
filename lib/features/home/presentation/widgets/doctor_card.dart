import 'package:flutter/material.dart';
import 'package:healthcare_app/core/helper/create_rating_row.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

class DoctorCard extends StatelessWidget {
  final String imagePath;
  final DoctorEntity doctorEntity;
  const DoctorCard({
    super.key,
    required this.imagePath,
    required this.doctorEntity,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        pushTo(
          context: context,
          path: Routes.doctorDetailScreen,
          extra: doctorEntity,
        );
      },
      child: Container(
        width: width / 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.greyColor.withValues(alpha: .2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Doctor image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: height / 5.5,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 6),

            // Doctor name
            Text(
              doctorEntity.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              maxLines: 1,
            ),

            const SizedBox(height: 4),

            // Specialty
            Text(
              doctorEntity.specialization,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 6),

            // Star rating
            createRatingRow(
              context: context,
              rating: doctorEntity.rating,
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
