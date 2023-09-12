import 'package:flutter/material.dart';

enum AppTheme { lightMode, darkMode }

Map<AppTheme, ThemeData> customTheme = {
  AppTheme.lightMode: ThemeData(
    primarySwatch: Colors.amber,
  ),
  AppTheme.darkMode: ThemeData(
    brightness: Brightness.dark,
  ),
};
