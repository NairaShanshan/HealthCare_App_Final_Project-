import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_app/core/cubit/favourite_doctors_cubit/favourite_doctors_cubit.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/services/get_it_service.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/app_fonts.dart';
import 'package:healthcare_app/core/utils/functions.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';
import 'package:healthcare_app/features/home/domain/repository/doctors_repository.dart';

import 'core/services/local/shared_pref.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en', null);
  await SharedPref.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteDoctorsCubit(
        getIt.get<DoctorsRepository>(),
      ),
      child: MaterialApp.router(
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
      ),
    );
  }
}
