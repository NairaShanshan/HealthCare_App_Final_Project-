import 'package:flutter/material.dart';
import 'package:healthcare_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:healthcare_app/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: const HomeScreenBody(),
    );
  }
}
