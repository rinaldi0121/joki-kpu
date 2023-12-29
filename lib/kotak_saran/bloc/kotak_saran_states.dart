class KotakSaranState {
  KotakSaranState({
    this.nama = "",
    this.alamat = "",
    this.noHp = "",
    this.pekerjaan = "",
    this.noKTP = "",
    this.saran = "",
  });

  final String alamat;
  final String nama;
  final String noHp;
  final String noKTP;
  final String pekerjaan;
  final String saran;

  KotakSaranState copyWith({
    String? alamat,
    String? nama,
    String? noHp,
    String? noKTP,
    String? pekerjaan,
    String? saran,
  }) {
    return KotakSaranState(
      alamat: alamat ?? this.alamat,
      nama: nama ?? this.nama,
      noHp: noHp ?? this.noHp,
      noKTP: noKTP ?? this.noKTP,
      pekerjaan: pekerjaan ?? this.pekerjaan,
      saran: saran ?? this.saran,
    );
  }
}
