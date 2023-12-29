import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_saran_kp/common/values/constant.dart';
import 'package:kotak_saran_kp/global.dart';
import 'package:kotak_saran_kp/login/bloc/login_blocs.dart';
import 'package:kotak_saran_kp/common/widgets/toast_helper.dart';

class LoginPageController {
  const LoginPageController({required this.context});

  final BuildContext context;

  Future<void> handleLogin() async {
    ToastHelper toastHelper = ToastHelper(context);
    final state = context.read<LoginBlocs>().state;
    String email = state.email.trim();
    String password = state.password.trim();

    if (email.isEmpty) {
      toastHelper.displayErrorMotionToast(
          "Email Kosong !", "Masukkan Email dengan benar !");
      return;
    }

    if (password.isEmpty) {
      toastHelper.displayErrorMotionToast(
          "Password Kosong !", "Masukkan Password dengan benar !");
      return;
    }

    try {
      loginDialog();
      final dio = Dio();
      final response = await dio.post(
        "https://kotak-surat-kpu.vercel.app/api/users/login",
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.data["status"] == "success" &&
          response.data["data"]["role"] == "admin") {
        await Global.storageService
            .setBool(AppConstants.storageOpenFirstTime, true);
        await Global.storageService.setString(AppConstants.storageAdminTokenKey,
            response.data["data"]["accessToken"]);
        navigateAdmin();
      }
      if (response.data["status"] == "success" &&
          response.data["data"]["role"] == "user") {
        await Global.storageService
            .setBool(AppConstants.storageOpenFirstTime, true);
        await Global.storageService.setString(AppConstants.storageUserTokenKey,
            response.data["data"]["accessToken"]);
        navigateUser();
      }
      FocusManager.instance.primaryFocus?.unfocus();
      toastHelper.displayTransparentMotionToast(
        response.data["message"],
        "Selamat Datang !",
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

  Future<void> navigateAdmin() async {
    await Navigator.pushNamedAndRemoveUntil(
        context, "/AdminPage", (route) => false);
  }

  Future<void> navigateUser() async {
    await Navigator.pushNamedAndRemoveUntil(
        context, "/KotakSaranPage", (route) => false);
  }

  Future<void> popDialog() async {
    Navigator.pop(context);
  }

  loginDialog() {
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
                "Sedang Login... Mohon Tunggu Beberapa Saat Lagi !",
              ),
            ],
          ),
        );
      },
    );
  }
}
