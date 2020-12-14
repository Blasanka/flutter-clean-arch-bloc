import 'package:shared_preferences/shared_preferences.dart';

class PrefConstants {
  static const String refreshToken = "refresh";
  static const String accessToken = "access";
}

class SharedPrefHelper {
  SharedPreferences _prefs;

  Future<dynamic> _getInstance() async => _prefs = await SharedPreferences.getInstance();

  Future<String> get(String key) async {
    await _getInstance();
    return _prefs.getString(key);
  }

  void set(String key, dynamic value) async {
    await _getInstance();
    _prefs.setString(key, value);
  }

  void remove(String key) async {
    await _getInstance();
    _prefs.remove(key);
  }
}