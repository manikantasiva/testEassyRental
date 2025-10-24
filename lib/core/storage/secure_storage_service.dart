import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/app_constants.dart';

class SecureStorageService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static Future<void> saveUserToken(String token) async {
    await _storage.write(key: AppConstants.userTokenKey, value: token);
  }

  static Future<String?> getUserToken() async {
    return await _storage.read(key: AppConstants.userTokenKey);
  }

  static Future<void> saveUserEmail(String email) async {
    await _storage.write(key: AppConstants.userEmailKey, value: email);
  }

  static Future<String?> getUserEmail() async {
    return await _storage.read(key: AppConstants.userEmailKey);
  }

  static Future<void> saveUserName(String name) async {
    await _storage.write(key: AppConstants.userNameKey, value: name);
  }

  static Future<String?> getUserName() async {
    return await _storage.read(key: AppConstants.userNameKey);
  }

  static Future<void> setLoggedIn(bool isLoggedIn) async {
    await _storage.write(
      key: AppConstants.isLoggedInKey,
      value: isLoggedIn.toString(),
    );
  }

  static Future<bool> isLoggedIn() async {
    final value = await _storage.read(key: AppConstants.isLoggedInKey);
    return value == 'true';
  }

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
