import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void saveString({required String key, required String value}) {
    sharedPreferences.setString(key, value);
  }

  static String? getString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

  static Future<void> saveThemeMode(bool isDarkMode) async {
    await sharedPreferences.setBool('is_dark_mode', isDarkMode);
  }

  static bool? getThemeMode() {
    return sharedPreferences.getBool('is_dark_mode');
  }
}

class SecureCacheHelper {
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static Future<void> saveToken({required String value}) async {
    await secureStorage.write(key: 'auth_token', value: value);
  }

  static Future<String?> getToken() async {
    return await secureStorage.read(key: 'auth_token');
  }

  static Future<void> removeToken() async {
    await secureStorage.delete(key: 'auth_token');
  }

  static Future<void> saveFCMToken({required String value}) async {
    await secureStorage.write(key: 'fcm_token', value: value);
  }

  static Future<String?> getFCMToken() async {
    return await secureStorage.read(key: 'fcm_token');
  }
}


