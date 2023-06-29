import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfessionalsScreen extends StatefulWidget {
  const ProfessionalsScreen({super.key});
  static const String routeName = 'professionals';

  @override
  State<ProfessionalsScreen> createState() => _ProfessionalsScreenState();
}

class _ProfessionalsScreenState extends State<ProfessionalsScreen> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    _fetchFakeData();
    super.initState();
  }

  Future<void> _fetchFakeData() {
    return Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profesionales'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // generate 100 widgets with network images and random doctor names
                  ...List.generate(
                    100,
                    (index) => ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://www.woolha.com/media/2020/03/eevee.png',
                        ),
                      ),
                      title: const Text('Dr. Juan Perez'),
                      subtitle: const Text('Medico general'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (_) => Dialog(
                            child: Container(
                              margin: EdgeInsets.all(20.r),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 80.r,
                                    backgroundImage: const NetworkImage(
                                      'https://www.woolha.com/media/2020/03/eevee.png',
                                    ),
                                  ),
                                  Text(
                                    'Dr. Juan Perez',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    'Medico general',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget velit vitae libero sodales aliquet. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl.',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  //Comenzar chat button
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  FilledButton.icon(
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      final result =
                                          await showOkCancelAlertDialog(
                                        context: context,
                                        title: 'Iniciar chat',
                                        message:
                                            '¿Estas seguro que deseas iniciar un chat con el Dr. Juan Perez?',
                                      );

                                      if (result == OkCancelResult.ok) {
                                        context.go('/chat');
                                      }
                                    },
                                    icon:
                                        const FaIcon(FontAwesomeIcons.message),
                                    label: const Text('Comenzar chat'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
