import 'package:evently/Utils/app_themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = AppThemes.lightTheme;

  void changeLocale(ThemeData theme) {
    if (theme == currentTheme) {
      return;
    }

    currentTheme = theme;

    notifyListeners();
  }

  bool isDarkMode() {
    return currentTheme == AppThemes.darkTheme;
  }
}
