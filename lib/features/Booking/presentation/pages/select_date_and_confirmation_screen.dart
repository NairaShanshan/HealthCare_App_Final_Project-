import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/available_time_selector.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/confirmation_dialog.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/date_picker_card.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/primary_button.dart';
import 'package:healthcare_app/features/Booking/presentation/widgets/reminder_time_selector.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

class SelectDateScreen extends StatefulWidget {
  final DoctorEntity doctor;
 

  
  final DateTime? initialDate;
  final String? initialTime;

  const SelectDateScreen({
    super.key,
    this.initialDate,
    this.initialTime,
   
    required this.doctor,
  });

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  late DateTime selectedDate;
  late String selectedTime;
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
                          : () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => ConfirmationDialog(
                                  doctorName: widget.doctor.name,
                                  speciality: widget.doctor.specialization,
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
}
