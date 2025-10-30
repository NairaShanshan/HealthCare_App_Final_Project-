import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';

class ReminderTimeSelector extends StatelessWidget {
  final List<String> reminderSlots;
  final int? selectedIndex;
  final Function(int) onSelect;

  const ReminderTimeSelector({
    super.key,
    required this.reminderSlots,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Remind Me Before",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const Gap(14),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reminderSlots.length,
            itemBuilder: (context, index) {
              final selected = selectedIndex == index;

              final parts = reminderSlots[index].split(" ");
              final number = parts.first;
              final unit = parts.length > 1 ? parts.last : "";

              return Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                child: GestureDetector(
                  onTap: () => onSelect(index),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primaryColor
                          : AppColors.secondaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected
                            ? AppColors.primaryColor
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          number,
                          style: TextStyle(
                            fontSize: 16,
                            color: selected
                                ? AppColors.whiteColor
                                : AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          unit,
                          style: TextStyle(
                            fontSize: 12,
                            color: selected
                                ? AppColors.whiteColor
                                : AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
