part of 'session_checker_bloc.dart';

abstract class SessionCheckerState extends Equatable {
  const SessionCheckerState();

  @override
  List<Object> get props => [];
}

class SessionCheckerInitial extends SessionCheckerState {}

class CheckingSession extends SessionCheckerState {}

class SessionCheckedError extends SessionCheckerState {
  final String message;

  const SessionCheckedError({required this.message});

  @override
  List<Object> get props => [message];
}

class SessionChecked extends SessionCheckerState {
  final bool isLogged;

  const SessionChecked({required this.isLogged});

  @override
  List<Object> get props => [isLogged];
}
