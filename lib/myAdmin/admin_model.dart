// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:kotak_saran_kp/global.dart';

class ListAdmin {
  ListAdmin({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ListAdmin.response(Map<String, dynamic> data) => ListAdmin(
        status: data["status"],
        message: data["message"],
        data: List<AllData>.from(data["data"].map((x) => AllData.response(x))),
      );

  final List<AllData> data;
  final String message;
  final String status;
}

class AllData {
  AllData({
    required this.id,
    required this.ktp,
    required this.name,
    required this.userEmail,
    required this.phone,
    required this.occupation,
    required this.address,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AllData.response(Map<String, dynamic> data) => AllData(
        id: data["id"],
        ktp: data["ktp"],
        name: data["name"],
        userEmail: data["user_email"],
        phone: data["phone"],
        occupation: data["occupation"],
        address: data["address"],
        message: data["message"],
        createdAt: data["created_at"],
        updatedAt: data["updated_at"],
      );

  final String address;
  final String createdAt;
  final String id;
  final String ktp;
  final String message;
  final String name;
  final String occupation;
  final String phone;
  final String updatedAt;
  final String userEmail;
}

ListAdmin listAdminResponse(Map<String, dynamic> str) =>
    ListAdmin.response(str);

Future<ListAdmin> fetchData() async {
  final dio = Dio();
  String token = Global.storageService.getStringAdminToken();
  dio.options.headers["authorization"] = "bearer $token";
  final response = await dio
      .get("https://kotak-surat-kpu.vercel.app/api/users/getAllFeedbacks");
  if (response.statusCode == 200 && response.data["status"] == "success") {
    return listAdminResponse(response.data);
  } else {
    throw Exception('Failed to load All Data');
  }
}
