import 'package:flutter/material.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_fonts.dart';
import 'package:healthcare_app/features/onboarding/onboarding_screen.dart';
import 'package:healthcare_app/features/splash/splash_screen.dart';

import 'core/services/local/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: AppFonts.Poppins),
    );
  }
}
