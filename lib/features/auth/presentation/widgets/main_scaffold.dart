import 'dart:ui';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Color backgroundColor;
  final Widget? bottomNavigationBar;

  const MainScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.backgroundColor = Colors.white,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: Container(
        color: backgroundColor,
        child: Stack(
          children: [
            // 🟢 Top-left circle
            Positioned(
              top: -100,
              left: -100,
              child: _buildBlurredCircle(),
            ),

            // 🟢 Bottom-right circle
            Positioned(
              bottom: -100,
              right: -100,
              child: _buildBlurredCircle(),
            ),

            // Page content
            body,
          ],
        ),
      ),
    );
  }

 Widget _buildBlurredCircle({Alignment alignment = Alignment.center}) {
  return Align(
    alignment: alignment,
    child: Container(
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0x4D407CE2), // Primary color with 30% opacity
            Color(0x4D82A9EF), // Lighter blue tint
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
        child: const SizedBox(),
      ),
    ),
  );
}

}
