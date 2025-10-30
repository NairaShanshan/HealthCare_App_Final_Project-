import 'package:flutter/material.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/app_fonts.dart';
import 'package:healthcare_app/core/utils/functions.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: Colors.transparent,
        ),
        fontFamily: AppFonts.poppins,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.accentColor,
          filled: true,
          hintStyle: TextStyles.textStyles15.copyWith(
            color: AppColors.greyColor,
          ),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          errorBorder: buildBorder(borderColor: AppColors.errorColor),
          focusedErrorBorder: buildBorder(borderColor: AppColors.errorColor),
        ),
      ),
    );
  }
}
