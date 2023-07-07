import 'package:doctor_fy/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:doctor_fy/features/auth/presentation/screens/onboarding_screen.dart';
import 'package:doctor_fy/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:doctor_fy/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:doctor_fy/features/chat/presentation/blocs/cubit/chat_cubit.dart';
import 'package:doctor_fy/features/chat/presentation/screens/categorias_screens.dart';
import 'package:doctor_fy/features/chat/presentation/screens/private_chat_screen.dart';
import 'package:doctor_fy/features/chat/presentation/screens/professionals_screen.dart';
import 'package:doctor_fy/features/splash/presentation/screens/error_screen.dart';
import 'package:doctor_fy/features/splash/presentation/screens/splash_screen.dart';
import 'package:doctor_fy/features/user/data/entities/profile.dart';
import 'package:doctor_fy/features/user/presentation/screens/configuraciones_screen.dart';
import 'package:doctor_fy/features/user/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: SplashScreen.routeName,
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'chat/:id',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            final chatCubit = extra['chatCubit'] as ChatCubit;
            final otherUserProfile = extra['otherUser'] as Profile;
            return BlocProvider.value(
              value: chatCubit
                ..setMessagesListener(
                  state.pathParameters['id']!,
                ),
              child: PrivateChatScreen(
                roomId: state.pathParameters['id']!,
                otherUser: otherUserProfile,
              ),
            );
          },
        ),
        GoRoute(
          path: ConfiguracionesScreen.routeName,
          builder: (context, state) => const ConfiguracionesScreen(),
        ),
        GoRoute(
          path: CategoriasScreen.routeName,
          builder: (context, state) => const CategoriasScreen(),
        ),
        GoRoute(
          path: ProfessionalsScreen.routeName,
          builder: (context, state) => const ProfessionalsScreen(),
        ),
      ],
    ),
    GoRoute(
      path: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnBoarding(),
    ),
    GoRoute(
      path: SignInScreen.routeName,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: ForgotPasswordScreen.routeName,
      builder: (context, state) => const ForgotPasswordScreen(),
    )
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);
