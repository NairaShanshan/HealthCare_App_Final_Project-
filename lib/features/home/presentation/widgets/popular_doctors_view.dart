import 'package:flutter/material.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';
import 'package:healthcare_app/features/home/presentation/widgets/doctor_card.dart';

class PopularDoctorsView extends StatelessWidget {
  const PopularDoctorsView({
    super.key,
    required this.doctors,
  });
  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    print(doctors.toString());
    return ListView.builder(
      itemCount: doctors.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 16),
        child: DoctorCard(
          // imagePath: AppImages.doctorOne,
          imagePath: doctors[index].imagePath,
          doctorName: doctors[index].name,
          specialty: doctors[index].specialization,
          rating: doctors[index].rating,
        ),
      ),
    );
  }
}
