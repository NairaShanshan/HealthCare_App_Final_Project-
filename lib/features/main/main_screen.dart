
import 'package:flutter/material.dart';
import 'package:healthcare_app/features/favourite/presentation/pages/favourite_screen.dart';

import 'package:healthcare_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';

import '../Booking/presentation/pages/appointment_screen.dart';
import '../home/presentation/pages/home_screen.dart';
import '../profile/presentation/pages/profile_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key, this.initialIndex});
  final int? initialIndex ;

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;

  List<Widget> pages = [
    HomeScreen(), // index=>0
    FavouriteScreen(),
    // index=>1
    AppointmentInfoScreen(),
    ProfileScreen(), // index=>2
    // The correct index for the ProfileScreen is 3, and the screen at index 2 hasnΓÇÖt been built yet.
  ];

  // @override
  // void didUpdateWidget(covariant MainAppScreen oldWidget) {
  //   _currentIndex = widget.initialIndex ?? _currentIndex;
  //   super.didUpdateWidget(oldWidget);
  // }
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex ?? 0;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(currentIndex: _currentIndex, onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      }),
    );
  }


}
