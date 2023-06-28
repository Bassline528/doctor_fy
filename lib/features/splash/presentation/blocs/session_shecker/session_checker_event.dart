part of 'session_checker_bloc.dart';

abstract class SessionCheckerEvent extends Equatable {
  const SessionCheckerEvent();

  @override
  List<Object> get props => [];
}

class CheckSession extends SessionCheckerEvent {}
