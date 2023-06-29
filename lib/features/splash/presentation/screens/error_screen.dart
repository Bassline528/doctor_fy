import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  static const routeName = '/error';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}
