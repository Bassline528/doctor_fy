part of 'rooms_cubit.dart';

@immutable
abstract class RoomsState {}

class RoomsLoading extends RoomsState {}

class RoomsLoaded extends RoomsState {
  final List<Profile> newUsers;
  final List<Room> rooms;

  RoomsLoaded({
    required this.rooms,
    required this.newUsers,
  });
}

class RoomsEmpty extends RoomsState {
  final List<Profile> newUsers;

  RoomsEmpty({required this.newUsers});
}

class RoomsError extends RoomsState {
  final String message;

  RoomsError(this.message);
}
