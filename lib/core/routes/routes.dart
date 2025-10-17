import 'package:go_router/go_router.dart';
import 'package:healthcare_app/features/auth/presentation/pages/login_screen.dart';
import 'package:healthcare_app/features/auth/presentation/pages/register_screen.dart';
import 'package:healthcare_app/features/onboarding/onboarding_screen.dart';
import 'package:healthcare_app/features/splash/splash_screen.dart';
import 'package:healthcare_app/features/welcome/welcome_screen.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';

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
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
}
