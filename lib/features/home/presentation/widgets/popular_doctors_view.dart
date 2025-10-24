import 'package:flutter/material.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/features/home/presentation/widgets/doctor_card.dart';

class PopularDoctorsView extends StatelessWidget {
  const PopularDoctorsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(right: 16),
        child: DoctorCard(
          imagePath: AppImages.doctorOne,
          doctorName: 'Dr. Fillerup Grab',
          specialty: 'Medicine Specialist',
        ),
      ),
    );
  }
}
