import 'package:doctor_fy/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:doctor_fy/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:doctor_fy/features/chat/presentation/screens/chat_screen.dart';
import 'package:doctor_fy/features/splash/presentation/screens/error_screen.dart';
import 'package:doctor_fy/features/splash/presentation/screens/splash_screen.dart';
import 'package:doctor_fy/features/user/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: SignInScreen.routeName,
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => SignUpScreen(),
    ),
    //TEMP ROUTE
    GoRoute(
      path: '/chat',
      builder: (context, state) => ChatPage(),
    ),
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);
