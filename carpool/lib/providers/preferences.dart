import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _keyLanguage = 'language';
  static const _keyThemeMode = 'themeMode';
  static bool dark = false;
  static bool pt = false;

  static Future<void> saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLanguage, languageCode);
    pt = languageCode == "pt" ? true : false;
    pt = languageCode == "pt" ? true : false;
  }

  static Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String? s = prefs.getString(_keyLanguage);
    dark = (s != null && s == "pt") ? true : false;
    return s;
  }

  static Future<void> saveThemeMode(String themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemeMode, themeMode);
    dark = themeMode == "dark" ? true : false;
  }

  static Future<String?> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    String? s = prefs.getString(_keyThemeMode);
    dark = (s != null && s == "dark") ? true : false;

    return s;
  }

  static bool isDarkMode() {
    return dark;
  }

  static bool isPt() {
    return pt;
  }
}