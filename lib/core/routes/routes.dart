import 'package:go_router/go_router.dart';
import 'package:healthcare_app/features/Booking/presentation/pages/appointment_screen.dart';
import 'package:healthcare_app/features/Booking/presentation/pages/select_date_and_confirmation_screen.dart';

import 'package:healthcare_app/features/auth/presentation/pages/signin_screen.dart';
import 'package:healthcare_app/features/auth/presentation/pages/signup_screen.dart';
import 'package:healthcare_app/features/home/presentation/pages/home_screen.dart';
import 'package:healthcare_app/features/onboarding/onboarding_screen.dart';
import 'package:healthcare_app/features/profile/presentation/pages/edit_profile.dart';
import 'package:healthcare_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:healthcare_app/features/splash/splash_screen.dart';
import 'package:healthcare_app/features/welcome/welcome_screen.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static const String welcome = '/welcome';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String profile =
      '/profile'; // This will be removed when the main screen is built.
  static const String editProfile =
      '/editProfile'; // But this one is not will be removed

  static const String home = '/home';
  static const String detailedScreen = '/detailed_screen';
  static const String booking = '/screen1';
  static const String selectDate = '/select-date_screen';

  static final routes = GoRouter(
    initialLocation: home,
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
        builder: (context, state) => const SigninScreen(),
      ),
      GoRoute(
        path: signup,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: editProfile,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: booking,
        builder: (context, state) => const AppointmentInfoScreen(),
      ),
      GoRoute(
        path: selectDate,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>?;
          return SelectDateScreen(
            doctorName: data?['doctorName'] ?? 'Dr. Ahmed ',
            initialDate: data?['date'],
            initialTime: data?['time'],
          );
        },
      ),
    ],
  );
}
