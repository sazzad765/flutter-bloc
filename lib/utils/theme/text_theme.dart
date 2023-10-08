import 'package:flutter/material.dart';

extension UIThemeExtension on TextTheme  {
  TextStyle get boldFont => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle get mediumFont => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  TextStyle get regularFont => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  TextStyle get titleFont => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
}
