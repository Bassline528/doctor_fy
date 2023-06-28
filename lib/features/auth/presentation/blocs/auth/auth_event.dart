part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInWithEmailAndPassword extends AuthEvent {
  const SignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class SignUpWithEmailAndPassword extends AuthEvent {
  const SignUpWithEmailAndPassword({
    required this.email,
    required this.password,
    required this.username,
  });
  final String email;
  final String password;
  final String username;

  @override
  List<Object> get props => [email, password, username];
}
