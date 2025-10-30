import 'package:flutter/material.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePickerCard extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Function(DateTime, DateTime) onDaySelected;

  const DatePickerCard({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFDEE8FC),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: TableCalendar(
        firstDay: DateTime.now(),
        lastDay: DateTime.now().add(const Duration(days: 10000)),
        focusedDay: focusedDay,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        calendarStyle: CalendarStyle(
          selectedDecoration: const BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
        ),
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        onDaySelected: onDaySelected,
      ),
    );
  }
}
