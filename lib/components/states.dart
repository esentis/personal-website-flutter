import 'package:esentispws/constants.dart';
import 'package:flutter/material.dart';

class ThemeStyle extends ChangeNotifier {
  kTheme themeStatus;
  kTheme getStatus() => themeStatus;
  ThemeStyle({this.themeStatus});
  void toggleTheme() {
    if (themeStatus == kTheme.light) {
      themeStatus = kTheme.dark;
      print('Theme is ${themeStatus.toString()}');
      notifyListeners();
    } else {
      themeStatus = kTheme.light;
      print('Theme is ${themeStatus.toString()}');
      notifyListeners();
    }
  }
}

class Language extends ChangeNotifier {
  kLocale localeStatus;
  kLocale getStatus() => localeStatus;
  Language({this.localeStatus});
  void toggleLanguage() {
    if (localeStatus == kLocale.greek) {
      localeStatus = kLocale.english;
      print('Language is ${localeStatus.toString()}');
      notifyListeners();
    } else {
      localeStatus = kLocale.greek;
      print('Language is ${localeStatus.toString()}');
      notifyListeners();
    }
  }
}
