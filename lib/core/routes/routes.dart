import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_app/core/constants/app_images.dart';

import 'package:healthcare_app/features/Booking/presentation/pages/appointment_screen.dart';
import 'package:healthcare_app/features/Booking/presentation/pages/select_date_and_confirmation_screen.dart';
import 'package:healthcare_app/features/auth/presentation/cubit/cubit.dart';

import 'package:healthcare_app/features/auth/presentation/pages/signin_screen.dart';
import 'package:healthcare_app/features/auth/presentation/pages/signup_screen.dart';
import 'package:healthcare_app/features/doctor/page/doctor_screen.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';
import 'package:healthcare_app/features/home/presentation/pages/doctor_detail_screen.dart';
import 'package:healthcare_app/features/home/presentation/pages/specialization_search_screen.dart';

import 'package:healthcare_app/features/main/main_screen.dart';
import 'package:healthcare_app/features/onboarding/onboarding_screen.dart';
import 'package:healthcare_app/features/profile/presentation/pages/edit_profile.dart';
import 'package:healthcare_app/features/search/page/search_screen.dart';

import 'package:healthcare_app/features/splash/splash_screen.dart';
import 'package:healthcare_app/features/welcome/welcome_screen.dart';

import '../../features/home/presentation/pages/detailed_screen.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static const String welcome = '/welcome';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String main = '/main';

  static const String editProfile =
      '/editProfile'; // But this one is not will be removed

  static const String detailedScreen = '/detailed_screen';
  static const String booking = '/screen1';
  static const String selectDate = '/select-date_screen';
  static const String search = '/search';
  static const String doctorScreen = '/doctorScreen';
  static const String doctorDetailScreen = '/SpecializationSearchScreen';
  static const String speSearch = '/s';
  static final routes = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: signin,
        builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(), child: const SigninScreen()),
      ),
      GoRoute(
        path: signup,
        builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(), child: const SignupScreen()),
      ),
      GoRoute(
        path: main,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>?;

          return MainAppScreen(
            doctor: (data != null && data['doctor'] != null)
                ? data['doctor'] as DoctorEntity
                : const DoctorEntity(
                    name: 'unknown',
                    rating: 3.0,
                    specialization: '',
                    imagePath: AppImages.doc7,
                    price: "330",
                    id: '',
                  ),
            initialIndex: data?['initialIndex'] as int? ?? 0,
          );
        },
      ),
      GoRoute(
        path: editProfile,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: detailedScreen,
        builder: (context, state) {
          return DetailedScreen(
            title: 'Popular Doctor ',
            popularDoctor: state.extra as List<DoctorEntity>,
          );
        },
      ),
      GoRoute(
        path: search,
        builder: (context, state) {
          return const SearchScreen();
        },
      ),
      GoRoute(
          path: speSearch,
          builder: (context, state) {
            final specialization = state.extra as String;
            return SpecializationSearchScreen(
              specialization: specialization,
            );
          }),
      GoRoute(
        path: booking,
        builder: (context, state) => AppointmentInfoScreen(
          doctorEntity: state.extra as DoctorEntity,
          imagePath: '',
        ),
      ),
      GoRoute(
          path: selectDate,
          builder: (context, state) => SelectDateScreen(
                doctorEntity: state.extra as DoctorEntity,
              )),
      GoRoute(
        path: doctorScreen,
        builder: (context, state) => DoctorScreen(
          doctorEntity: state.extra as DoctorEntity,
        ),
      ),
      GoRoute(
        path: doctorDetailScreen,
        builder: (context, state) => DoctorDetailScreen(
          imagePath: AppImages.profileImage,
          doctorEntity: state.extra as DoctorEntity,
        ),
      ),
    ],
  );
}
