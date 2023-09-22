import 'package:flutter/material.dart';

// abstract class AppTheme {
//   static ThemeData get lightTheme => ThemeData.light();
//
//   static ThemeData get darkTheme => ThemeData.dark();
// }
class AppThemes {
  static final appThemeData = {
    AppTheme.light: ThemeData.light(),
    AppTheme.dark: ThemeData.dark(),
  };
}

enum AppTheme {
  light,
  dark,
}

extension AppThemeExtension on AppTheme {
  String get text {
    switch (this) {
      case AppTheme.light:
        return 'light';
      case AppTheme.dark:
        return 'Dark';
      default:
        return 'light';
    }
  }

  Color get color {
    switch (this) {
      case AppTheme.light:
        return Colors.white;
      case AppTheme.dark:
        return Colors.black;
      default:
        return Colors.white;
    }
  }
}
