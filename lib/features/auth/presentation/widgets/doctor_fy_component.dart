import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorFy extends StatelessWidget {
  const DoctorFy({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svgs/doctorfy.svg',
          height: 200.h,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ],
    );
  }
}
