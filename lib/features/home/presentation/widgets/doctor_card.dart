
import 'package:flutter/material.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';

class DoctorCard extends StatelessWidget {
  final String imagePath;
  final String doctorName;
  final String specialty;

  const DoctorCard({
    super.key,
    required this.imagePath,
    required this.doctorName,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
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
              height: 145,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 6),

          // Doctor name
          Text(
            doctorName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 4),

          // Specialty
          Text(
            specialty,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 6),

          // Star rating
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              Icon(Icons.star, color: Colors.amber, size: 20),
              Icon(Icons.star, color: Colors.amber, size: 20),
              Icon(Icons.star, color: Colors.amber, size: 20),
              Icon(Icons.star_border, color: Colors.amber, size: 20),
            ],
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}


