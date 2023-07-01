// ignore_for_file: use_build_context_synchronously

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doctor_fy/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignOutInProgress) {
          context.loaderOverlay.show();
          return;
        }

        if (state is AuthInitial) {
          context.loaderOverlay.hide();
          context.go('/sign_in');
          return;
        }
      },
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
  });

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
              child: const Icon(Icons.edit),
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
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Cerrar sesión',
                message: '¿Estás seguro de cerrar sesión?',
                okLabel: 'Si',
                cancelLabel: 'No',
              );

              if (result == OkCancelResult.ok) {
                context.read<AuthBloc>().add(SignOut());
              }
            },
          ),
        ],
      ),
    );
  }
}
