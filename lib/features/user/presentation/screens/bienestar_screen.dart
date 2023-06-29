import 'package:doctor_fy/core/widgets/no_data.dart';
import 'package:flutter/material.dart';

class BienestarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const NoDataToShow(
        noDataText: 'No hay bienestar por el momento',
        child: Icon(
          Icons.health_and_safety_outlined,
          size: 100,
        ),
      ),
    );
  }
}
