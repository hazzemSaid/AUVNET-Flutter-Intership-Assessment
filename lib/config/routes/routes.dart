import 'package:ecommerce/features/auth/presentation/view/screens/login_screen.dart';
import 'package:ecommerce/features/auth/presentation/view/screens/signup_screen.dart';
import 'package:ecommerce/features/introdactions/presentation/screens/onboarding_screen.dart';
import 'package:ecommerce/features/introdactions/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

class RouteManager {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(
        path: '/onbording',
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(path: '/sginup', builder: (context, state) => SignupScreen()),
    ],
  );
}
