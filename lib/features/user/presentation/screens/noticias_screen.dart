import 'package:doctor_fy/core/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoticiasScreen extends StatefulWidget {
  @override
  State<NoticiasScreen> createState() => _NoticiasScreenState();
}

class _NoticiasScreenState extends State<NoticiasScreen> {
  late bool _hasNews;

  @override
  void initState() {
    _hasNews = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: _hasNews
            ? AvailableNews()
            : NoDataToShow(
                child: FaIcon(
                  FontAwesomeIcons.newspaper,
                  size: 100.sp,
                ),
                noDataText: 'No tienes noticias por el momento',
              ),
      ),
    );
  }
}

class AvailableNews extends StatelessWidget {
  const AvailableNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: const Column(
          children: [
            _NewsCard(),
            _NewsCard(),
            _NewsCard(),
            _NewsCard(),
            _NewsCard(),
          ],
        ),
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({
    super.key,
  });

  Widget getTitle(ThemeData themeData) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10.r,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          'Doctor Home',
          style: themeData.textTheme.titleMedium!.copyWith(
            color: themeData.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTitle(
                  Theme.of(context),
                ),
                // large lorem impusm
                Text('Lorem ipsum dolor sit amet, consectetu'),
              ],
            ),
            FlutterLogo(
              size: 50.r,
            )
          ],
        ),
      ),
    );
  }
}
