import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'dart:async'; // For Timer

import '../../core/services/local/shared_pref.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool isOnboardingShown = SharedPref.isOnBoardingShown();
    User? user = FirebaseAuth.instance.currentUser;

    Future.delayed(const Duration(seconds: 3), () {
      if (user != null) {

        pushReplacement(context, Routes.main);
      } else {
        if (isOnboardingShown) {
          pushReplacement(context, Routes.welcome);
        } else {
          pushReplacement(context, Routes.onboarding);
        }
      }
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FB), // light blue background
      body: Stack(
        children: [
          // Pills on top-right corner
          Positioned(
            top: 80,
            right: 40,
            child: Transform.rotate(
              angle: -0.3,
              child: Row(
                children: [
                  _pill(color: Colors.teal.shade100),
                  const SizedBox(width: 8),
                  _pill(color: Colors.teal.shade200),
                ],
              ),
            ),
          ),

          // Bandage bottom-right
          Positioned(
            bottom: 40,
            right: 40,
            child: Container(
              width: 100,
              height: 25,
              decoration: BoxDecoration(
                color: const Color(0xFFE7EDF4),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          // Stethoscope (bottom-left curved line)
          Positioned(
            bottom: -40,
            left: -50,
            child: Transform.rotate(
              angle: -0.4,
              child: Icon(
                Icons.health_and_safety,
                size: 200,
                color: Colors.grey.shade300,
              ),
            ),
          ),

          // Center logo and text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Heart + Cross icon
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CustomPaint(
                    painter: _HeartPainter(),
                  ),
                ),
                const SizedBox(height: 24),

                // Title
                const Text(
                  "Healthcare",
                  style: TextStyle(
                    color: Color(0xFF2B3A67),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Subtitle
                const SizedBox(height: 6),
                const Text(
                  "Medical app",
                  style: TextStyle(
                    color: Color(0xFF7A8CA5),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Pill element
  Widget _pill({required Color color}) {
    return Container(
      width: 25,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

// Painter for blue gradient heart + cross
class _HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF3B82F6), Color(0xFF1E40AF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    final Path path = Path();
    final w = size.width;
    final h = size.height;

    // Draw heart outline
    path.moveTo(w * 0.5, h * 0.75);
    path.cubicTo(w * 0.2, h * 0.45, w * 0.05, h * 0.25, w * 0.3, h * 0.15);
    path.cubicTo(w * 0.45, h * 0.1, w * 0.55, h * 0.1, w * 0.7, h * 0.15);
    path.cubicTo(w * 0.95, h * 0.25, w * 0.8, h * 0.45, w * 0.5, h * 0.75);
    canvas.drawPath(path, paint);

    // Draw plus (+) inside
    final Paint crossPaint = Paint()
      ..color = const Color(0xFF2B3A67)
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    final double cx = w * 0.5;
    final double cy = h * 0.45;
    canvas.drawLine(Offset(cx - 15, cy), Offset(cx + 15, cy), crossPaint);
    canvas.drawLine(Offset(cx, cy - 15), Offset(cx, cy + 15), crossPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
