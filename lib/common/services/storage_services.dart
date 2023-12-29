import 'package:kotak_saran_kp/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;

  // save to localStorage
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // set the value for localstorage (isLogin true/false)
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  // setter method to return string
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  // method to return the bool values after been setted with setBool
  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.storageOpenFirstTime) ?? false;
  }

  // method to return the bool values after been setted with setBool
  bool getIsLoggedInAsAdmin() {
    return _prefs.getString(AppConstants.storageAdminTokenKey) == null
        ? false
        : true;
  }

  getStringAdminToken() {
    return _prefs.getString(AppConstants.storageAdminTokenKey);
  }

  bool getIsLoggedInAsUser() {
    return _prefs.getString(AppConstants.storageUserTokenKey) == null
        ? false
        : true;
  }

  getStringUserToken() {
    return _prefs.getString(AppConstants.storageUserTokenKey);
  }
}
