import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          Center(
            child: CircleAvatar(
              radius: 50.r,
              child: const Icon(Icons.image),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 300.w,
            child: Text(
              'Nelson Tomas Aranda Barboza',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: 300.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  'Premium',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            trailing: const Icon(Icons.arrow_forward_ios),
            title: const Text('Editar perfil'),
            onTap: () {},
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.fileMedical),
            trailing: const Icon(Icons.arrow_forward_ios),
            title: const Text('Historial médico'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            trailing: const Icon(Icons.arrow_forward_ios),
            title: const Text('Configuraciones'),
            onTap: () => context.push('/settings'),
          ),
        ],
      ),
    );
  }
}
