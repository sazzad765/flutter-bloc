import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.light: ThemeData.light()
        .copyWith(scaffoldBackgroundColor: CustomColors.appBackground),
    AppTheme.dark: ThemeData.dark(),
  };
}

class CustomColors {
  static const primary = Color(0xff221A45);
  static const lightBlue = Color(0xffe4f5ed);

  // static const appBackground = Color(0xFFF2F7FA);
  static const appBackground = Color(0xFFF6F6F6);
  static const topBackground = Color(0xFFEFEFEF);
  static const topBackgroundDark = Color(0xFF151026);
  static const roundIconBackground = Color(0xFF585AF9);
  static const divider = Colors.grey;
  static const lightGrey = Color(0xffF3F2F2);
  static const button = Color(0xffF8B335);
}

class CustomSpacing {
  static const xSmall = 4.0;
  static const small = 8.0;
  static const medium = 16.0;
  static const large = 32.0;
  static const xLarge = 64.0;

  static SizedBox verticalSpace({double space = medium}) {
    return SizedBox(
      height: space,
    );
  }

  static SizedBox horizontalSpace({double space = medium}) {
    return SizedBox(
      width: space,
    );
  }
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
        return '';
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
