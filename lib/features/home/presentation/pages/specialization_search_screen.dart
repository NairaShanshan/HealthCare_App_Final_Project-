import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/core/constants/doctors_images.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/services/firestore_service.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';
import 'package:healthcare_app/core/widgets/main_header.dart';
import 'package:healthcare_app/features/home/data/models/doctor_model.dart';
import 'package:healthcare_app/features/home/presentation/widgets/detailed_doctor_card.dart';

class SpecializationSearchScreen extends StatelessWidget {
  final String specialization;
  const SpecializationSearchScreen({super.key, required this.specialization});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MainHeader(
            title: ' $specialization',
            onBackButtonPressed: () {
              pop(context);
            }),
      ),
      body: FutureBuilder(
        future: FirestoreService.filterDoctorsBySpecialization(specialization),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return snapshot.data?.docs.isEmpty == true
              ? const EmptyWidget()
              : Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DoctorModel doctor = DoctorModel.fromJson(
                        snapshot.data!.docs[index].data()
                            as Map<String, dynamic>,
                      );
                      if (doctor.specialization == '' ||
                          doctor.specialization == null) {
                        return const SizedBox();
                      }
                      String imagePath =
                          doctorImages[doctor.id] ?? AppImages.doc7;
                      // return DoctorCard(
                      //   doctor: doctor,
                      // );
                      return DetailedDoctorCard(
                          imagePath: imagePath,
                          doctorName: doctor.name,
                          specialty: doctor.specialization,
                          rating: doctor.rating);
                    },
                  ),
                );
        },
      ),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.no_search,
              width: 200,
            ),
            const SizedBox(height: 24),
            Text(
              "No doctors found in this specialty.",
              style: TextStyles.textStyles22.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
