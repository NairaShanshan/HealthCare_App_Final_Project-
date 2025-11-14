import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/core/helper/app_regex.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';
import 'package:healthcare_app/core/widgets/main_text_form_field.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/doctor_card.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/patient_option_card.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

class AppointmentInfoScreen extends StatefulWidget {
  final DoctorEntity doctorEntity;
  final String imagePath;

  const AppointmentInfoScreen({
    super.key,
    required this.doctorEntity,
    required this.imagePath,
  });

  @override
  State<AppointmentInfoScreen> createState() => _AppointmentInfoScreenState();
}

class _AppointmentInfoScreenState extends State<AppointmentInfoScreen> {
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorCard(
                name: widget.doctorEntity.name,
                specialty: widget.doctorEntity.specialization,
                price: '\$${widget.doctorEntity.price}',
                rating: widget.doctorEntity.rating.toDouble(),
                image: widget.doctorEntity.imagePath,
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
              MainTextFormField(
                controller: nameController,
                hintText: 'Patient Name',
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Patient Name';
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(12),
              MainTextFormField(
                controller: phoneController,
                hintText: 'Contact Number',
                textInputType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter phone number.';
                  } else if (!AppRegex.isEgyptMobile(value)) {
                    return 'Please enter a valid phone number.';
                  } else {
                    return null;
                  }
                },
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
                    if (_formKey.currentState!.validate()) {
                      nameController.clear();
                      phoneController.clear();
                      pushTo(
                          context: context,
                          path: Routes.selectDate,
                          extra: widget.doctorEntity);
                    }
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
      ),
    );
  }
}
