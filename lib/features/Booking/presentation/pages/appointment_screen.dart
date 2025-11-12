import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/doctor_card.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/patient_option_card.dart';

class AppointmentInfoScreen extends StatefulWidget {
  const AppointmentInfoScreen({super.key});

  @override
  State<AppointmentInfoScreen> createState() => _AppointmentInfoScreenState();
}

class _AppointmentInfoScreenState extends State<AppointmentInfoScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  int selectedPatient = 0;

  final List<Map<String, dynamic>> patients = [
    {'label': 'My Self', 'image': AppImages.mySelf},
    {'label': 'My Child', 'image': AppImages.child},
    {'label': 'My Wife', 'image': AppImages.wife},
    {'label': 'My Parents', 'image': AppImages.parents},
    {'label': 'Others', 'icon': Icons.group},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Appointment'),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DoctorCard(
              name: 'Dr. Pediatrician',
              specialty: 'Specialist Cardiologist',
              price: '\$28.00/hr',
              rating: 4.9,
              image: AppImages.doctorTwo,
              isFavorite: false,
            ),
            const Gap(15),
            Text(
              'Appointment For',
              style: TextStyles.textStyles16.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Patient Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Gap(12),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Contact Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Gap(15),
            Text(
              'Who is this patient?',
              style: TextStyles.textStyles16.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(patients.length, (index) {
                  final p = patients[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: PatientOptionCard(
                      label: p['label'],
                      image: p['image'],
                      icon: p['icon'],
                      selected: selectedPatient == index,
                      onTap: () => setState(() => selectedPatient = index),
                    ),
                  );
                }),
              ),
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  pushTo(context: context, path: Routes.selectDate);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyles.textStyles22.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
