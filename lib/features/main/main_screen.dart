// import 'package:flutter/material.dart';
// import 'package:healthcare_app/features/doctor/page/doctor_screen.dart';
// import 'package:healthcare_app/features/favourite/presentation/pages/favourite_screen.dart';
// import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

// import 'package:healthcare_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';

// import '../home/presentation/pages/home_screen.dart';
// import '../profile/presentation/pages/profile_screen.dart';

// class MainAppScreen extends StatefulWidget {
//   const MainAppScreen({super.key, this.initialIndex, required this.doctor});
//   final int? initialIndex;
//   final DoctorEntity doctor;
//   @override
//   State<MainAppScreen> createState() => _MainAppScreenState();
// }

// class _MainAppScreenState extends State<MainAppScreen> {
//   int _currentIndex = 0;

//   List<Widget> pages = [
//     HomeScreen(),
//     FavouriteScreen(),
//     DoctorScreen(doctor: , ),
//     ProfileScreen(),
//   ];

//   // @override
//   // void didUpdateWidget(covariant MainAppScreen oldWidget) {
//   //   _currentIndex = widget.initialIndex ?? _currentIndex;
//   //   super.didUpdateWidget(oldWidget);
//   // }
//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = widget.initialIndex ?? 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[_currentIndex],
//       bottomNavigationBar: CustomBottomNavBar(
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           }),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:healthcare_app/features/doctor/page/doctor_screen.dart';
import 'package:healthcare_app/features/favourite/presentation/pages/favourite_screen.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';
import 'package:healthcare_app/features/home/presentation/pages/home_screen.dart';
import 'package:healthcare_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:healthcare_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key, this.initialIndex, required this.doctor});
  final int? initialIndex;
  final DoctorEntity doctor;

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  late int _currentIndex;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex ?? 0;

    pages = [
      const HomeScreen(),
      const FavouriteScreen(),
      DoctorScreen(doctor: widget.doctor),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
