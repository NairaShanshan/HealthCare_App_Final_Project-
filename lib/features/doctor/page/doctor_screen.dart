import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/core/constants/doctors_images.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';
import 'package:healthcare_app/core/widgets/main_button.dart';
import 'package:healthcare_app/core/widgets/main_header.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';
import 'package:healthcare_app/features/home/presentation/widgets/detailed_doctor_card.dart';

import '../../Booking/presentation/widgets/doctor_card.dart';

class DoctorScreen extends StatelessWidget {
  final DoctorEntity doctor;
  const DoctorScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MainHeader(
            title: 'Doctor Details',
            onBackButtonPressed: () {
              pop(context);
            }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailedDoctorCard(
                imagePath: doctorImages[doctor.id] ?? AppImages.doc7,
                doctorName: doctor.name,
                specialty: doctor.specialization,
                rating: doctor.rating.toDouble(),
              ),
              const Gap(30),
              MainButton(
                  text: 'Book Now',
                  onPressed: () {
                    pushTo(
                        context: context, path: Routes.booking, extra: doctor);
                  }),
              const Gap(20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.accentColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                '100',
                                style: TextStyles.textStyles16.copyWith(
                                  color: AppColors.darkColor,
                                ),
                              ),
                              Text(
                                'Running',
                                style: TextStyles.textStyles16.copyWith(
                                  color: AppColors.secondGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(5),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                '500',
                                style: TextStyles.textStyles16.copyWith(
                                  color: AppColors.darkColor,
                                ),
                              ),
                              Text(
                                'Ongoing',
                                style: TextStyles.textStyles16.copyWith(
                                  color: AppColors.secondGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(5),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                '700',
                                style: TextStyles.textStyles16.copyWith(
                                  color: AppColors.darkColor,
                                ),
                              ),
                              Text(
                                'Patient',
                                style: TextStyles.textStyles16.copyWith(
                                  color: AppColors.secondGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Text(
                'Services',
                style: TextStyles.textStyles22
                    .copyWith(color: AppColors.darkColor),
              ),
              const Gap(20),
              const _ServiceItem(
                  number: 1,
                  text: 'Patient care should be the number one priority.'),
              const Gap(5),
              const Divider(),
              const _ServiceItem(
                  number: 2,
                  text: 'If you run your practice you know how frustrating.'),
              const Gap(5),
              const Divider(),
              const _ServiceItem(
                  number: 3,
                  text: 'That’s why some of appointment reminder system.'),
            ],
          ),
        ),
      ),
    );
  }
}

// ServiceItem widget
class _ServiceItem extends StatelessWidget {
  final int number;
  final String text;
  const _ServiceItem({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number.',
            style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
