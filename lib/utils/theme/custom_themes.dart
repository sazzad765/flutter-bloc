import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.light: ThemeData.light().copyWith(
        primaryColor: const Color(0xff221A45),
        dividerColor: CustomColors.divider,
        scaffoldBackgroundColor: CustomColors.appBackground,
        iconTheme: const IconThemeData().copyWith(color: Colors.grey),
        primaryIconTheme: const IconThemeData().copyWith(color: Colors.grey),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors.button,
          ),
        ),
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: Colors.white,
            elevation: 1,
            iconTheme: const IconThemeData().copyWith(color: Colors.black),
            actionsIconTheme:
                const IconThemeData().copyWith(color: Colors.black),
            titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        cardColor: Colors.white,
        bottomSheetTheme: const BottomSheetThemeData().copyWith(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)))),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(CustomColors.primary),
          trackColor: MaterialStateProperty.all(CustomColors.primary),
        )),
    AppTheme.dark: ThemeData.dark().copyWith(
      dividerColor: Colors.white70,
      primaryColor: const Color(0xff221A45),
      primaryIconTheme: const IconThemeData().copyWith(color: Colors.white),
      iconTheme: const IconThemeData().copyWith(color: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.button,
        ),
      ),
      appBarTheme: const AppBarTheme().copyWith(
          elevation: 1,
          iconTheme: const IconThemeData().copyWith(color: Colors.white),
          actionsIconTheme: const IconThemeData().copyWith(color: Colors.white),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)))),
    ),
  };
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}

class CustomColors {
  static const primary = Color(0xff221A45);
  static const lightBlue = Color(0xffe4f5ed);

  // static const appBackground = Color(0xFFF2F7FA);
  static const appBackground = Color(0xFFF6F6F6);
  static const topBackground = Color(0xFFEFEFEF);
  static const topBackgroundDark = Color(0xFF151026);
  static const roundIconBackground = Color(0xFF585AF9);
  static const divider = Colors.black12;
  static const lightGrey = Color(0xffF3F2F2);
  static const button = Color(0xffF8B335);
  static const shimmerBase = Color(0xFFEBEBF4);
  static const shimmerHighlight = Color(0xFFF4F4F4);
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
