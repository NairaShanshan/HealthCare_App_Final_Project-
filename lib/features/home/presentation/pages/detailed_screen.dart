import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/features/auth/presentation/widgets/main_back_button.dart';
import 'package:healthcare_app/features/auth/presentation/widgets/main_scaffold.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';
import 'package:healthcare_app/features/home/presentation/widgets/detailed_doctor_card.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({
    super.key,
    required this.title,
    required this.popularDoctor,
  });
  final String title;
  final List<DoctorEntity> popularDoctor;
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  const MainBackButton(),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: popularDoctor.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: DetailedDoctorCard(
                        imagePath: AppImages.doctorOne,
                        doctorEntity: popularDoctor[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Base background
      child: Stack(
        children: [
          // 🟢 Top-left blurred circle
          Positioned(
            top: -100,
            left: -100,
            child: _buildBlurredCircle(),
          ),

          // 🟢 Bottom-right blurred circle
          Positioned(
            bottom: -100,
            right: -100,
            child: _buildBlurredCircle(),
          ),

          // Main content
          child,
        ],
      ),
    );
  }

  // Circle builder with blur and opacity
  Widget _buildBlurredCircle() {
    return Container(
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0x4D0EBE7E), // #0EBE7E with 30% opacity
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
        child: const SizedBox(),
      ),
    );
  }
}
