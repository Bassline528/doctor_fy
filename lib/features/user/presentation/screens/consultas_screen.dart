import 'package:doctor_fy/features/chat/presentation/screens/professionals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ConsultasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Escoge una categoria',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  const Divider(),
                  Text(
                    'Categorias',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10.0.h),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(height: 10.0.h),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      _CategoryCard(
                        leading: const FaIcon(
                          FontAwesomeIcons.stethoscope,
                        ),
                        titleText: 'Telemedicina 24/7',
                        subtitleText: 'Acceso a medicos las 24 horas',
                        onTap: () {
                          context.push('/${ProfessionalsScreen.routeName}');
                        },
                      ),
                      _CategoryCard(
                        leading: const FaIcon(
                          FontAwesomeIcons.handHoldingMedical,
                        ),
                        titleText: 'Atención psicologica',
                        subtitleText: 'Resuelve tus dudas con un psicologo',
                        onTap: () {},
                      ),
                      _CategoryCard(
                        leading: const FaIcon(
                          FontAwesomeIcons.brain,
                        ),
                        titleText: 'Atención psiquiatrica',
                        subtitleText: 'Resuelve tus dudas con un psiquiatra',
                        onTap: () {},
                      ),
                      _CategoryCard(
                        leading: const FaIcon(
                          FontAwesomeIcons.bowlFood,
                        ),
                        titleText: 'Nutricionista',
                        subtitleText: 'Resuelve tus dudas con un nutricionista',
                        onTap: () {},
                      ),
                      _CategoryCard(
                        leading: const FaIcon(
                          FontAwesomeIcons.dumbbell,
                        ),
                        titleText: 'Personal trainer',
                        subtitleText: 'Accede a un entrenador personal',
                        onTap: () {},
                      ),
                      _CategoryCard(
                        leading: const FaIcon(
                          FontAwesomeIcons.handDots,
                        ),
                        titleText: 'Dermatología',
                        subtitleText: 'Resuelve tus dudas con un dermatologo',
                        onTap: () {},
                      ),
                      _CategoryCard(
                        leading: const FaIcon(
                          FontAwesomeIcons.coins,
                        ),
                        titleText: 'Couch financiero',
                        subtitleText:
                            'Resuelve tus dudas con un couch financiero',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.leading,
    required this.titleText,
    required this.subtitleText,
    required this.onTap,
  });

  final Widget leading;
  final String titleText;
  final String subtitleText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: leading,
        title: Text(titleText),
        subtitle: Text(subtitleText),
        trailing: Icon(
          Icons.arrow_forward_ios,
        ),
        onTap: onTap,
      ),
    );
  }
}
