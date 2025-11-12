import 'package:flutter/material.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/widgets/main_button.dart';
import 'package:healthcare_app/core/widgets/main_header.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

class DoctorDetailScreen extends StatelessWidget {
  final String imagePath;
  final DoctorEntity doctorEntity;

  const DoctorDetailScreen({
    super.key,
    required this.imagePath,
    required this.doctorEntity,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainHeader(
                title: 'Doctor Detail',
                onBackButtonPressed: () => pop(context),
              ),
              const SizedBox(
                height: 30,
              ),
              HorizontalDetailedDoctorCard(
                imagePath: imagePath,
                doctorEntity: doctorEntity,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'About',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const ReadMoreText(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                maxLines: 2,
              ),
              const Spacer(),
              MainButton(
                text: 'Book Apointment',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalDetailedDoctorCard extends StatelessWidget {
  const HorizontalDetailedDoctorCard({
    super.key,
    required this.imagePath,
    required this.doctorEntity,
  });

  final String imagePath;
  final DoctorEntity doctorEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            imagePath,
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorEntity.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                doctorEntity.specialization,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.greyColor,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primaryColor.withValues(alpha: .2),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        doctorEntity.rating.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ReadMoreText({
    Key? key,
    required this.text,
    this.maxLines = 2,
  }) : super(key: key);

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: isExpanded ? null : widget.maxLines,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: const TextStyle(color: AppColors.greyColor, fontSize: 14),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () {
            setState(() => isExpanded = !isExpanded);
          },
          child: Text(
            isExpanded ? 'Read less' : 'Read more',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
