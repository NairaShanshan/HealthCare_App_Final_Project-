import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/core/constants/app_images.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height / 4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00C6FB), Color(0xFF005BEA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hi ${FirebaseAuth.instance.currentUser?.displayName ?? 'User'}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Find Your Doctor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                AppImages.noProfileImage,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
