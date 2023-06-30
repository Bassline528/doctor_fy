// ignore_for_file: use_build_context_synchronously

import 'package:doctor_fy/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:doctor_fy/features/splash/presentation/blocs/session_shecker/session_checker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SessionCheckerBloc(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({
    super.key,
  });

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    context.read<SessionCheckerBloc>().add(CheckSession());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionCheckerBloc, SessionCheckerState>(
      listener: (context, state) async {
        if (state is SessionChecked) {
          if (state.isLogged) {
            context.go('/');
          } else {
            final prefs = await SharedPreferences.getInstance();
            final firstTime = prefs.getBool('firstTime');
            if (firstTime == null) {
              await prefs.setBool('firstTime', true);
              context.go('/onboarding');
            } else {
              context.go(SignInScreen.routeName);
            }
          }
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
