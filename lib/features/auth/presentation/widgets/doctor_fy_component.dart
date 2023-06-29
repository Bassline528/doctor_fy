import 'package:flutter/material.dart';

class DoctorFy extends StatelessWidget {
  const DoctorFy({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const FlutterLogo(
          size: 50,
        ),
        Text(
          'DOCTORFY',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
