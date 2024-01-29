import 'package:flutter/material.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/constant.dart';
import 'package:razpay/core/utils/shared_pref.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  hintColor: grey,
  primaryColor: primary,
  scaffoldBackgroundColor: white,
  primaryColorLight: primary,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primary,
      iconColor: primary,
    ),
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: white,
    elevation: 0,
    foregroundColor: black,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  hintColor: grey,
  primaryColor: primary,
  scaffoldBackgroundColor: const Color(0xff10192D),
  primaryColorDark: primary,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primary,
      iconColor: primary,
    ),
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff10192D),
    elevation: 0,
    foregroundColor: white,
  ),
);

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme = darkTheme;
  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeProvider() {
    _loadThemePreference();
  }

  ThemeData get selectedTheme => _selectedTheme;

  void toggleTheme() {
    _saveThemePreference(!_isDark);
    notifyListeners();
  }

  void _loadThemePreference() async {
    bool isDarkMode = await SharedPref.getBool(kTheme) ?? true;
    _isDark = isDarkMode;
    notifyListeners();
  }

  void _saveThemePreference(bool isDar) async {
    bool isDarkMode = isDar;
    _isDark = isDar;
    SharedPref.setBool(kTheme, isDarkMode);
    notifyListeners();
  }
}
