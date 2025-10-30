import 'package:flutter/material.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';

class AvailableTimeSelector extends StatelessWidget {
  final List<String> availableTimes;
  final int? selectedIndex;
  final Function(int) onSelect;

  const AvailableTimeSelector({
    super.key,
    required this.availableTimes,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(availableTimes.length, (index) {
          final selected = selectedIndex == index;

          final parts = availableTimes[index].split(' ');
          final hour = parts.first;
          final period = parts.length > 1 ? parts[1] : '';

          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => onSelect(index),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? AppColors.primaryColor
                      : AppColors.secondaryColor,
                  border: Border.all(
                    color: selected
                        ? AppColors.primaryColor
                        : Colors.grey.shade300,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyColor.withOpacity(0.08),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hour,
                      style: TextStyle(
                        fontSize: 13,
                        color: selected
                            ? AppColors.whiteColor
                            : AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      period,
                      style: TextStyle(
                        fontSize: 11,
                        color: selected
                            ? AppColors.whiteColor.withOpacity(0.9)
                            : AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
