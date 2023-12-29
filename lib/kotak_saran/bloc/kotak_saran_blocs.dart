import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_saran_kp/kotak_saran/bloc/kotak_saran_events.dart';
import 'package:kotak_saran_kp/kotak_saran/bloc/kotak_saran_states.dart';

class KotakSaranBloc extends Bloc<KotakSaranEvent, KotakSaranState> {
  KotakSaranBloc() : super(KotakSaranState()) {
    on<NamaEvent>(_namaEvent);
    on<AlamatEvent>(_alamatEvent);
    on<NoHpEvent>(_noHpEvent);
    on<PekerjaanEvent>(_pekerjaanEvent);
    on<NoKtpEvent>(_noKtpEvent);
    on<SaranEvent>(_saranEvent);
  }

  void _namaEvent(NamaEvent event, Emitter<KotakSaranState> emit) {
    emit(state.copyWith(nama: event.nama));
  }

  void _alamatEvent(AlamatEvent event, Emitter<KotakSaranState> emit) {
    emit(state.copyWith(alamat: event.alamat));
  }

  void _noHpEvent(NoHpEvent event, Emitter<KotakSaranState> emit) {
    emit(state.copyWith(noHp: event.noHp));
  }

  void _pekerjaanEvent(PekerjaanEvent event, Emitter<KotakSaranState> emit) {
    emit(state.copyWith(pekerjaan: event.pekerjaan));
  }

  void _noKtpEvent(NoKtpEvent event, Emitter<KotakSaranState> emit) {
    emit(state.copyWith(noKTP: event.noKTP));
  }

  void _saranEvent(SaranEvent event, Emitter<KotakSaranState> emit) {
    emit(state.copyWith(saran: event.saran));
  }
}
