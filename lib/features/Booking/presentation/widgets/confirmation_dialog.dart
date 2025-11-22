
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';

import 'package:healthcare_app/core/utils/app_colors.dart';




class ConfirmationDialog extends StatelessWidget {
  final String doctorName;
  final String speciality;
  final DateTime date;
  final String time;

  const ConfirmationDialog({
    super.key,
    required this.doctorName,
    required this.speciality,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    const themeColor = AppColors.primaryColor;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.secondaryColor,
              child: Icon(
                Icons.thumb_up_off_alt_rounded,
                color: AppColors.primaryColor,
                size: 45,
              ),
            ),
            const Gap(10),
            const Text("Thank You!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Gap(10),
            const Text("Your Appointment Successful",
                style: TextStyle(color: Colors.grey)),
            const Gap(10),
            Text(
              "Your appointment with $doctorName ($speciality) has been successfully booked.",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54, fontSize: 15),
            ),
            const Gap(10),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.calendar_today_outlined,
                          color: themeColor, size: 20),
                      const Gap(8),
                      Text(
                        "${date.day}/${date.month}/${date.year}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time,
                          color: themeColor, size: 20),
                      const Gap(8),
                      Text(
                        time,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(10),
            ElevatedButton(
              onPressed: () {
               pushToBase(context, Routes.main) ;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text(
                "Done",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
            const Gap(5),
            TextButton(
              onPressed: () {
                pop(context);
              },
              child: const Text(
                "Edit your appointment",
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



