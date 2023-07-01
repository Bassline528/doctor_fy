import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctor_fy/core/constants/constants.dart';
import 'package:doctor_fy/features/user/data/entities/profile.dart';

part 'profiles_state.dart';

class ProfilesCubit extends Cubit<ProfilesState> {
  ProfilesCubit() : super(ProfilesInitial());

  /// Map of app users cache in memory with profile_id as the key
  final Map<String, Profile?> _profiles = {};

  Future<void> getProfile(String userId) async {
    if (_profiles[userId] != null) {
      return;
    }

    final data = await supabase
        .from('profiles')
        .select()
        .match({'id': userId}).single() as Map<String, dynamic>?;

    if (data == null) {
      return;
    }
    _profiles[userId] = Profile.fromJson(data);

    emit(ProfilesLoaded(profiles: _profiles));
  }
}
