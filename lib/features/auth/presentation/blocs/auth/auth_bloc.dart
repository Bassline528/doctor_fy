import 'package:bloc/bloc.dart';
import 'package:doctor_fy/core/constants/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInWithEmailAndPassword>((event, emit) async {
      try {
        final response = await supabase.auth.signInWithPassword(
          email: event.email,
          password: event.password,
        );

        emit(SignInSuccess(sessionData: response.session!));
      } on AuthException catch (error) {
        emit(SignInError(error.message));
      } catch (_) {
        emit(const SignUpError('Unexpected error'));
      }
    });

    on<SignUpWithEmailAndPassword>((event, emit) async {
      final email = event.email;
      final password = event.password;
      final username = event.username;
      try {
        await supabase.auth.signUp(
          email: email,
          password: password,
          data: {'username': username},
        );

        emit(SignUpSuccess());
      } on AuthException catch (error) {
        emit(SignUpError(error.message));
      } catch (error) {
        emit(const SignUpError('Unexpected error'));
      }
    });
  }
}
