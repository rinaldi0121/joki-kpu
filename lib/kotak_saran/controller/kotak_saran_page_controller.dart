import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_saran_kp/global.dart';
import 'package:kotak_saran_kp/kotak_saran/bloc/kotak_saran_blocs.dart';
import 'package:kotak_saran_kp/common/widgets/toast_helper.dart';
import 'package:dio/dio.dart';

class KotakSaranController {
  const KotakSaranController({required this.context});

  final BuildContext context;

  Future<void> handleKirimSaran() async {
    ToastHelper toastHelper = ToastHelper(context);
    final state = context.read<KotakSaranBloc>().state;
    String nama = state.nama.trim();
    String alamat = state.alamat.trim();
    String noHp = state.noHp.trim();
    String noKTP = state.noKTP.trim();
    String pekerjaan = state.pekerjaan.trim();
    String saran = state.saran.trim();

    if (nama.isEmpty) {
      toastHelper.displayErrorMotionToast(
          "Nama Kosong !", "Masukkan Nama dengan benar !");
      return;
    }
    if (nama.length > 255) {
      toastHelper.displayErrorMotionToast("Nama Terlalu Panjang !",
          "Nama Tidak Boleh Lebih Dari 255 Karakter !");
      return;
    }

    if (alamat.isEmpty) {
      toastHelper.displayErrorMotionToast(
          "Alamat Kosong !", "Masukkan Alamat dengan benar !");
      return;
    }
    if (alamat.length > 150) {
      toastHelper.displayErrorMotionToast("Alamat Terlalu Panjang !",
          "Alamat Tidak Boleh Lebih Dari 150 Karakter !");
      return;
    }

    if (noHp.isEmpty) {
      toastHelper.displayErrorMotionToast(
          "Nomor Telepon Kosong !", "Masukkan Nomor Telepon dengan benar !");
      return;
    }
    if (noHp.length > 20) {
      toastHelper.displayErrorMotionToast("Nomor Telepon Terlalu Panjang !",
          "Nomor Telepon Tidak Boleh Lebih Dari 20 Karakter !");
      return;
    }

    if (noKTP.isEmpty) {
      toastHelper.displayErrorMotionToast(
          "Nomor KTP Kosong !", "Masukkan Nomor KTP dengan benar !");
      return;
    }
    if (noKTP.length > 16) {
      toastHelper.displayErrorMotionToast("Nomor KTP Terlalu Panjang !",
          "Nomor KTP Tidak Boleh Lebih Dari 16 Karakter !");
      return;
    }

    if (pekerjaan.isEmpty) {
      toastHelper.displayErrorMotionToast(
          "Pekerjaan Kosong !", "Masukkan Pekerjaan dengan benar !");
      return;
    }
    if (pekerjaan.length > 50) {
      toastHelper.displayErrorMotionToast("Pekerjaan Terlalu Panjang !",
          "Pekerjaan Tidak Boleh Lebih Dari 50 Karakter !");
      return;
    }

    if (saran.isEmpty) {
      toastHelper.displayErrorMotionToast(
          "Saran Kosong !", "Masukkan Saran dengan benar !");
      return;
    }
    try {
      sendDialog();
      final dio = Dio();
      String token = Global.storageService.getStringUserToken();
      dio.options.headers["authorization"] = "bearer $token";
      await dio.post(
        "https://kotak-surat-kpu.vercel.app/api/users/addFeedback",
        data: {
          "ktp": noKTP,
          "name": nama,
          "phone": noHp,
          "occupation": pekerjaan,
          "address": alamat,
          "message": saran,
        },
      );
      navigate();
      toastHelper.displayTransparentMotionToast(
        "Data Berhasil Terkirim ke Email !",
        "Terima Kasih Atas Masukan Yang Telah Anda Berikan !",
      );
    } on DioException catch (e) {
      popDialog();
      if (e.response != null) {
        toastHelper.displayErrorMotionToast(
          e.response?.data["message"],
          "",
        );
      } else {
        toastHelper.displayErrorMotionToast(
          "Internal Server Error !",
          "Coba Lagi nanti !",
        );
      }
    }
  }

  Future<void> navigate() async {
    await Navigator.pushNamedAndRemoveUntil(
        context, "/KotakSaranPage", (route) => false);
  }

  Future<void> popDialog() async {
    Navigator.pop(context);
  }

  sendDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text(
                "Sedang Mengirim Email... Mohon Tunggu Beberapa Saat Lagi !",
              ),
            ],
          ),
        );
      },
    );
  }
}
