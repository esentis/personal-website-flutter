import 'package:esentispws/constants.dart';
import 'package:flutter/material.dart';

class ThemeStyle extends ChangeNotifier {
  kTheme themeStatus;
  getStatus() => themeStatus;
  ThemeStyle({this.themeStatus});
  toggleTheme() {
    if (themeStatus == kTheme.light) {
      themeStatus = kTheme.dark;
      print("CHANGING THEME");
      notifyListeners();
    } else {
      themeStatus = kTheme.light;
      print("CHANGING THEME");
      notifyListeners();
    }
  }
}

class Language extends ChangeNotifier {
  kLocale localeStatus;
  getStatus() => localeStatus;
  Language({this.localeStatus});
  toggleLanguage() {
    if (localeStatus == kLocale.greek) {
      localeStatus = kLocale.english;
      print("CHANGING LANGUAGE");
      notifyListeners();
    } else {
      localeStatus = kLocale.greek;
      print("CHANGING LANGUAGE");
      notifyListeners();
    }
  }
}