import 'package:doctor_fy/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      headerBackgroundColor: Theme.of(context).colorScheme.background,
      finishButtonText: 'Empezar',
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      onFinish: () {
        context.go(SignInScreen.routeName);
      },
      controllerColor: Theme.of(context).colorScheme.onBackground,
      background: const [
        SizedBox(
          height: 480,
        ),
        SizedBox(
          height: 480,
        ),
        SizedBox(
          height: 480,
        ),
        SizedBox(
          height: 480,
        ),
        SizedBox(
          height: 480,
        ),
        SizedBox(
          height: 480,
        ),
      ],
      totalPage: 6,
      speed: 1.8,
      pageBodies: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Mejora tu vida...',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Y cambia el mundo en el que vivimos',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Transforma tus hábitos saludables...',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'En donaciones sociales',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Tendrás un seguro de vida gratis',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                '¡Que crece con tus buenos hábitos!',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
