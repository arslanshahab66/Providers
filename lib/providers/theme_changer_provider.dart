
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  var _thememode = ThemeMode.light;
  ThemeMode get themeMode => _thememode;

  void setTheme(ThemeMode) {
    _thememode = ThemeMode;
    notifyListeners();
  }
}
