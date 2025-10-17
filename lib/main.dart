import 'package:flutter/material.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: Routes.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: AppFonts.Poppins,
        ));
  }
}
