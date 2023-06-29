import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              child: Icon(Icons.image),
            ),
          ),
          SizedBox(
            height: 30.h,
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
            leading: Icon(Icons.edit),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Editar perfil'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.medical_information),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Historial médico'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Configuraciones'),
            onTap: () => context.push('/settings'),
          ),
        ],
      ),
    );
  }
}
