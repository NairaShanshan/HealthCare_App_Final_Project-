import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/features/home/data/models/specialization_model.dart';

import 'package:flutter/material.dart';

class SpecializationList extends StatelessWidget {
  const SpecializationList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: specializations.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final spec = specializations[index];

          return GestureDetector(
            onTap: () {
              pushTo(
                  context: context, path: Routes.speSearch, extra: spec.name);
            },
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      spec.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black.withOpacity(0.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        spec.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          shadows: [
                            Shadow(
                              blurRadius: 6,
                              color: Colors.black54,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

final List<Specialization> specializations = [
  Specialization(name: "Cardiology", image: 'assets/images/cardiology.png'),
  Specialization(name: "Dentistry", image: 'assets/images/dentistry.png'),
  Specialization(name: 'Neurology', image: 'assets/images/Neurology.png'),
  Specialization(
      name: "Pediatric Medicine", image: 'assets/images/Pediatrics.png'),
  Specialization(
      name: "Internal Medicine", image: 'assets/images/Internal Medicine.png'),
  Specialization(name: 'Orthopedics', image: 'assets/images/Orthopedics.png'),
  Specialization(
      name: 'Gynecology&Obstetrics',
      image: 'assets/images/Gynecology & Obstetrics.png'),
  Specialization(
      name: "Gastroenterology", image: 'assets/images/Gastroenterology.png'),
  Specialization(
      name: 'ENT (Ear,Nose&Throat)',
      image: 'assets/images/ENT (Ear, Nose & Throat).png'),
  Specialization(name: 'Psychiatry', image: 'assets/images/Psychiatry.png'),
];
