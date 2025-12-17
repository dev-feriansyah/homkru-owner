import 'package:flutter/material.dart';
import 'package:homekru_owner/core/utils/pref_utils.dart';
import 'package:homekru_owner/theme/theme_helper.dart';


class ThemeProvider extends ChangeNotifier {
  bool _isDark;

  ThemeProvider({required bool isDark}) : _isDark = isDark;

  bool get isDark => _isDark;

  ThemeData get themeData {
    return ThemeHelper(isDark: _isDark).themeData;
  }

  void setTheme(String themeType) {
    _isDark = themeType == 'dark';
    PrefUtils().setThemeData(themeType);
    notifyListeners();
  }
}
