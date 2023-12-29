import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_saran_kp/register/bloc/register_blocs.dart';
import 'package:kotak_saran_kp/common/widgets/toast_helper.dart';

class RegisterPageController {
  const RegisterPageController({required this.context});

  final BuildContext context;

  Future<void> handleRegister() async {
    ToastHelper toastHelper = ToastHelper(context);
    final state = context.read<RegisterBlocs>().state;
    String email = state.email.trim();
    String password = state.password.trim();
    String rePassword = state.rePassword.trim();

    if (email.isEmpty) {
      toastHelper.displayErrorMotionToast(
          "Email Kosong !", "Masukkan Email dengan benar !");
      return;
    }
    if (email.length > 100) {
      toastHelper.displayErrorMotionToast("Email Terlalu Panjang !",
          "Email Tidak Boleh Lebih Dari 100 Karakter !");
      return;
    }

    if (password.isEmpty) {
      toastHelper.displayErrorMotionToast(
          "Password Kosong !", "Masukkan Password dengan benar !");
      return;
    }
    if (password.length < 6) {
      toastHelper.displayErrorMotionToast("Password Terlalu Pendek !",
          "Password Tidak Boleh Lebih Dari 6 Karakter !");
      return;
    }
    if (password.length > 12) {
      toastHelper.displayErrorMotionToast("Password Terlalu Panjang !",
          "Password Tidak Boleh Lebih Dari 12 Karakter !");
      return;
    }

    if (rePassword.isEmpty) {
      toastHelper.displayErrorMotionToast("Konfirmasi Password Kosong !",
          "Masukkan Konfirmasi Password dengan benar !");
      return;
    }
    if (rePassword != password) {
      toastHelper.displayErrorMotionToast("Konfirmasi Password Tidak Sama !",
          "Pastikan Konfirmasi Password Sama Dengan Password !");
      return;
    }

    try {
      registerDialog();
      final dio = Dio();
      final response = await dio.post(
        "https://kotak-surat-kpu.vercel.app/api/users/register",
        data: {
          "email": email,
          "password": password,
        },
      );
      navigate();
      toastHelper.displayTransparentMotionToast(
        response.data["message"],
        "Silakan Login !",
      );
    } on DioException catch (e) {
      await popDialog();
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
        context, "/LoginPage", (route) => false);
  }

  Future<void> popDialog() async {
    Navigator.pop(context);
  }

  registerDialog() {
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
                "Sedang Registrasi... Mohon Tunggu Beberapa Saat Lagi !",
              ),
            ],
          ),
        );
      },
    );
  }
}
