import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_saran_kp/Login/bloc/Login_events.dart';
import 'package:kotak_saran_kp/Login/bloc/Login_states.dart';

class LoginBlocs extends Bloc<LoginEvents, LoginState> {
  LoginBlocs() : super(LoginState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
