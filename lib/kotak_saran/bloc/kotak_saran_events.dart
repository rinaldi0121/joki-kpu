abstract class KotakSaranEvent {
  const KotakSaranEvent();
}

class NamaEvent extends KotakSaranEvent {
  const NamaEvent(this.nama);

  final String nama;
}

class AlamatEvent extends KotakSaranEvent {
  const AlamatEvent(this.alamat);

  final String alamat;
}

class NoHpEvent extends KotakSaranEvent {
  const NoHpEvent(this.noHp);

  final String noHp;
}

class PekerjaanEvent extends KotakSaranEvent {
  const PekerjaanEvent(this.pekerjaan);

  final String pekerjaan;
}

class NoKtpEvent extends KotakSaranEvent {
  const NoKtpEvent(this.noKTP);

  final String noKTP;
}

class SaranEvent extends KotakSaranEvent {
  const SaranEvent(this.saran);

  final String saran;
}
