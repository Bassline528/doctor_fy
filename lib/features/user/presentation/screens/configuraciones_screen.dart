import 'package:doctor_fy/core/helpers/terms_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:settings_ui/settings_ui.dart';

class ConfiguracionesScreen extends StatefulWidget {
  const ConfiguracionesScreen({super.key});

  static const routeName = 'settings';

  @override
  State<ConfiguracionesScreen> createState() => _ConfiguracionesScreenState();
}

class _ConfiguracionesScreenState extends State<ConfiguracionesScreen> {
  late bool _useBiometric;
  late bool _useNotifications;

  @override
  void initState() {
    _useBiometric = true;
    _useNotifications = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuraciones'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Acceso'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    _useBiometric = value;
                  });
                },
                initialValue: _useBiometric,
                leading: const FaIcon(FontAwesomeIcons.fingerprint),
                title: const Text('Acceso biométrico'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Notificaciones'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    _useNotifications = value;
                  });
                },
                initialValue: _useNotifications,
                leading: Icon(
                  _useNotifications
                      ? Icons.notifications
                      : Icons.notifications_off,
                ),
                title: const Text('Recibir notificaciones'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Cuenta'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                onPressed: showTerms,
                leading: const FaIcon(
                  FontAwesomeIcons.book,
                ),
                title: const Text(
                  'Términos y condiciones',
                ),
              ),
              // SettingsTile.navigation(
              //   leading: const Icon(
              //     Icons.medical_information,
              //   ),
              //   title: const Text(
              //     'Planes de suscripción',
              //   ),
              // ),
              SettingsTile.navigation(
                onPressed: (context) {},
                leading: FaIcon(
                  FontAwesomeIcons.user,
                  color: Theme.of(context).colorScheme.error,
                ),
                trailing: Icon(
                  Icons.delete_forever_outlined,
                  color: Theme.of(context).colorScheme.error,
                ),
                title: Text(
                  'Eliminar cuenta',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
