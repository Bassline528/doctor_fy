import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoDataToShow extends StatelessWidget {
  const NoDataToShow(
      {super.key, required this.noDataText, required this.child});

  final Widget child;
  final String noDataText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child,
          const SizedBox(
            height: 10,
          ),
          Text(noDataText),
        ],
      ),
    );
  }
}
