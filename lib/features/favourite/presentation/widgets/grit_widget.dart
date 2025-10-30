import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';

class GridContainerWidget extends StatelessWidget {
  const GridContainerWidget({
    super.key,
    required this.imagePath,
    required this.doctorName,
    required this.specialty,
  });

  final String imagePath;
  final String doctorName;
  final String specialty;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.accentColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 42,
          ),
          const Gap(10),
          Text(
            doctorName,
            style: TextStyles.textStyles18,
          ),
          const Gap(5),
          Text(
            specialty,
            style: TextStyles.textStyles15.copyWith(
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}

