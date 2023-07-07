import 'package:doctor_fy/core/constants/constants.dart';
import 'package:doctor_fy/features/chat/presentation/blocs/profiles/profiles_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilesCubit, ProfilesState>(
      builder: (context, state) {
        if (state is ProfilesLoaded) {
          final user = state.profiles[userId];
          return CircleAvatar(
            child:
                user == null ? preloader : Text(user.username.substring(0, 2)),
          );
        } else {
          return const CircleAvatar(child: preloader);
        }
      },
    );
  }
}
