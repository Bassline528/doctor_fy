part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class SignInInProgress extends AuthState {}

class SignUpInProgress extends AuthState {}

class SignInSuccess extends AuthState {
  const SignInSuccess({required this.sessionData});
  final Session sessionData;

  @override
  List<Object> get props => [sessionData];
}

class SignUpSuccess extends AuthState {}

class SignInError extends AuthState {
  const SignInError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

class SignUpError extends AuthState {
  const SignUpError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
