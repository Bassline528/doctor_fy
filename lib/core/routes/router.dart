import 'package:doctor_fy/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:doctor_fy/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:doctor_fy/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:doctor_fy/features/chat/presentation/screens/chat_screen.dart';
import 'package:doctor_fy/features/splash/presentation/screens/error_screen.dart';
import 'package:doctor_fy/features/splash/presentation/screens/splash_screen.dart';
import 'package:doctor_fy/features/user/presentation/screens/configuraciones_screen.dart';
import 'package:doctor_fy/features/user/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'chat',
          builder: (context, state) => const ChatPage(),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const ConfiguracionesScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/sign_in',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/forgot',
      builder: (context, state) => const ForgotPasswordScreen(),
    )
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);
