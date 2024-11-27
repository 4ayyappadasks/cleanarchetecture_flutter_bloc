import 'package:hive/hive.dart';

class AuthService {
  static final Box _authBox = Hive.box('authBox');

  static Future<void> saveAccessToken(String token) async {
    await _authBox.put('accessToken', token);
  }

  static String? getAccessToken() {
    return _authBox.get('accessToken');
  }

  static Future<void> clearTokens() async {
    await _authBox.clear();
  }
}
