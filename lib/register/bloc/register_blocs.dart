import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_saran_kp/register/bloc/register_events.dart';
import 'package:kotak_saran_kp/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvents, RegisterState> {
  RegisterBlocs() : super(RegisterState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
