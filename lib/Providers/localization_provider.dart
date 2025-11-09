import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  String currentLocal = "en";

  void changeLocale(String local) {
    if (local == currentLocal) {
      return;
    }

    currentLocal = local;

    notifyListeners();
  }
}
