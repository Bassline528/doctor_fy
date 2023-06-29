import 'package:bloc/bloc.dart';
import 'package:doctor_fy/core/constants/constants.dart';
import 'package:equatable/equatable.dart';

part 'session_checker_event.dart';
part 'session_checker_state.dart';

class SessionCheckerBloc
    extends Bloc<SessionCheckerEvent, SessionCheckerState> {
  SessionCheckerBloc() : super(SessionCheckerInitial()) {
    on<CheckSession>((event, emit) {
      emit(CheckingSession());
      final session = supabase.auth.currentSession;
      if (session == null) {
        emit(const SessionChecked(isLogged: false));
      } else {
        emit(const SessionChecked(isLogged: true));
      }
    });
  }
}
