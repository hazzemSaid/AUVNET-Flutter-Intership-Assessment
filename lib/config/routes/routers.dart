import 'package:ecommerce/config/routes/GoRouterRefreshStream.dart';
import 'package:ecommerce/features/auth/presentation/view/screens/login_screen.dart';
import 'package:ecommerce/features/auth/presentation/view/screens/signup_screen.dart';
import 'package:ecommerce/features/auth/presentation/viewmodel/bloc/Auth_bloc/auth_bloc.dart';
import 'package:ecommerce/features/introdactions/presentation/screens/onboarding_screen.dart';
import 'package:ecommerce/features/introdactions/presentation/screens/splash_screen.dart';
import 'package:ecommerce/features/navigation/presentation/screens/nav_bar_screen.dart';
import 'package:go_router/go_router.dart';

class RouteManager {
  static GoRouter createRouter(AuthBloc authBloc) {
    return GoRouter(
      initialLocation: '/navbar',
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      redirect: (context, state) {
        final authState = authBloc.state;
        final isLoggedIn = authState is AuthAuthenticated;

        final isLoggingIn =
            state.uri.path == '/login' ||
            state.uri.path == '/signup' ||
            state.uri.path == '/onbording';

        if (isLoggedIn && isLoggingIn) return '/navbar';
        if (!isLoggedIn && state.uri.path == '/navbar') return '/';

        return null;
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
        GoRoute(
          path: '/onbording',
          builder: (context, state) => OnboardingScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: '/navbar',
          builder: (context, state) => const NavBarScreen(),
        ),
      ],
    );
  }
}
