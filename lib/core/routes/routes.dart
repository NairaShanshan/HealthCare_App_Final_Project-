import 'package:go_router/go_router.dart';
import 'package:healthcare_app/features/auth/presentation/pages/signin_screen.dart';
import 'package:healthcare_app/features/auth/presentation/pages/signup_screen.dart';
import 'package:healthcare_app/features/home/presentation/pages/detailed_screen.dart';
import 'package:healthcare_app/features/home/presentation/pages/home_screen.dart';
import 'package:healthcare_app/features/onboarding/onboarding_screen.dart';
import 'package:healthcare_app/features/splash/splash_screen.dart';
import 'package:healthcare_app/features/welcome/welcome_screen.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static const String welcome = '/welcome';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String detailedScreen = '/detailed_screen';

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
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: detailedScreen,
        builder: (context, state) => DetailedScreen(
          title: state.extra as String,
        ),
      ),
    ],
  );
}
