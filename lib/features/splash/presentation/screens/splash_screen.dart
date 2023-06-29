import 'package:doctor_fy/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:doctor_fy/features/splash/presentation/blocs/session_shecker/session_checker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
      listener: (context, state) {
        if (state is SessionChecked) {
          if (state.isLogged) {
            context.go('/chat');
          } else {
            context.go(SignInScreen.routeName);
          }
        }
      },
      child: const Scaffold(
        body: Center(
          child: Text('App'),
        ),
      ),
    );
  }
}
