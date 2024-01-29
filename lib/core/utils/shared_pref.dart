import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();

  static setString(String key, String value) async {
    final SharedPreferences pref = await _preferences;
    pref.setString(key, value);
  }

  static Future<String> getString(String key) async {
    final SharedPreferences pref = await _preferences;
    return pref.getString(key)!;
  }

  static setBool(String key, bool value) async {
    final SharedPreferences pref = await _preferences;
    pref.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    final SharedPreferences pref = await _preferences;
    return pref.getBool(key);
  }
}
