import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/available_time_selector.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/confirmation_dialog.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/date_picker_card.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/primary_button.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/reminder_time_selector.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

import '../../../../core/services/doctor_services.dart';
import '../../../appointment/data/models/appointment_model.dart';
import 'package:intl/intl.dart';

class SelectDateScreen extends StatefulWidget {
  final DoctorEntity doctorEntity;  final String patientName;
  final String phone;
  final String patientRelation;
  final DateTime? initialDate;
  final String? initialTime;

  const SelectDateScreen({
    super.key,
    this.initialDate,
    this.initialTime,
    required this.doctorEntity, required this.patientName, required this.phone, required this.patientRelation,
  });

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  late DateTime selectedDate;
  late String selectedTime;
  late String patientName;
  late  String phone;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int? selectedTimeIndex;
  int? selectedReminderIndex;
  final List<String> availableTimes = [
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '01:30 PM',
    '02:00 PM',
  ];
  final List<String> reminderTimes = [
    '10 Min',
    '25 Min',
    '30 Min',
    '35 Min',
    '40 Min',
  ];

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime.now();
    selectedTime = widget.initialTime ?? '';
    patientName = widget.patientName;
    phone = widget.phone;
  }

  void showAlertDialog(BuildContext context, String docID) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text("حذف الحجز"),
          content: const Text("هل متاكد من حذف هذا الحجز ؟"),
          actions: [
            TextButton(
              child: const Text("لا"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("نعم"),
              onPressed: () {
                DoctorService.deleteAppointment(docID).then((_) {
                  pop(context) ;
                  setState(() {});
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DatePickerCard(
                      focusedDay: _focusedDay,
                      selectedDay: _selectedDay,
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                    ),
                    const Gap(20),
                    const Text(
                      "Available Time",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Gap(14),
                    AvailableTimeSelector(
                      availableTimes: availableTimes,
                      selectedIndex: selectedTimeIndex,
                      onSelect: (index) {
                        setState(() {
                          selectedTimeIndex = index;

                          selectedTime = availableTimes[index];
                        });
                      },
                    ),
                    const Gap(20),
                    ReminderTimeSelector(
                      reminderSlots: reminderTimes,
                      selectedIndex: selectedReminderIndex,
                      onSelect: (index) {
                        setState(() {
                          selectedReminderIndex = index;
                        });
                      },
                    ),
                    const Gap(44),
                    PrimaryButton(
                      text: 'Confirm',
                      onPressed: selectedTimeIndex == null
                          ? null
                          : () async {
                        // Create appointment
                        await _createAppointment(
                          date: _selectedDay ?? _focusedDay,
                          time: availableTimes[selectedTimeIndex!],
                          patientName: patientName,
                          phone: phone,
                        );


                        // Show Confirmation Dialog

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => ConfirmationDialog(
                            doctorName: widget.doctorEntity.name,
                            speciality: widget.doctorEntity.specialization,
                            date: _selectedDay ?? _focusedDay,
                            time: availableTimes[selectedTimeIndex!],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Future<void> _createAppointment({
    required DateTime date,
    required String time,
    required String patientName,
    required String phone,
  }) async {
    try {
      // Format the date as yyyy-MM-dd
      final dateString = DateFormat('yyyy-MM-dd').format(date);

      // Combine date and time
      final combinedString = "$dateString $time"; // e.g. "2025-12-24 09:00 AM"

      // Parse into DateTime
      final parsedDateTime = DateFormat("yyyy-MM-dd hh:mm a").parse(combinedString);

      // Create model with parsed DateTime
      var appointmentData = AppointmentModel(
        patientID: FirebaseAuth.instance.currentUser?.uid ?? "",
        doctorID: widget.doctorEntity.id,
        name: widget.patientName,
        doctorName: widget.doctorEntity.name,
        phone: widget.phone,
        date: parsedDateTime, // استخدمي هنا الـ DateTime اللي اتعمله parse صح
        isComplete: false,
      );

      await DoctorService.createAppointment(appointmentData);
      print("Appointment created successfully at $parsedDateTime");
    } catch (e) {
      print("Error parsing appointment date: $e");
    }
  }
}

