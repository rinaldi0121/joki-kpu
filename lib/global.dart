import 'package:flutter/material.dart';
import 'package:kotak_saran_kp/common/services/storage_services.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    storageService = await StorageService().init();
  }
}
