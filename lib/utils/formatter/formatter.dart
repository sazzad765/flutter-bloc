import 'package:intl/intl.dart';

extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;
}

class Formatter {
  static String formatNegativeDecimal(double number) {
    bool isNegative = number < 0;
    if (isNegative) number = number * -1;
    return isNegative ? '-${formatDecimal(number)}' : formatDecimal(number);
  }

  static String formatDecimal(double number) {
    final text = number.toString();
    if (number.isInt) return number.round().toString();
    final splitted = text.split('.');
    if (number < 0) {
      return '0';
    } else {
      if (splitted.length == 1) {
        return Formatter.formatNumber(number);
      } else if (splitted.length == 2) {
        if (double.parse(splitted[1]) > 0) {
          return number.toStringAsFixed(2).toString();
        } else {
          return Formatter.formatNumber(number);
        }
      } else {
        return number.toString();
      }
    }
  }

  static String formatNumber(
    num number, {
    int minDigits = 0,
    int maxDigits = 2,
  }) {
    final formatter = NumberFormat();

    formatter.minimumFractionDigits = minDigits;
    formatter.maximumFractionDigits = maxDigits;

    return formatter.format(number);
  }

  static String thousandsSeparators(double number,
      {bool showPointValue = true}) {
    final value = formatNegativeDecimal(number);
    num value2;
    // value2 = double.tryParse(value) ?? 0.0;
    if (showPointValue) {
      value2 = double.tryParse(value) ?? 0.0;
    } else {
      value2 = double.tryParse(value)?.round() ?? 0;
    }

    NumberFormat numberFormat = NumberFormat.decimalPattern('en_US'); //hi
    return numberFormat.format(value2);
  }

  static String formatNumberAbbreviated(int number) {
    if (number >= 1000000000) {
      double billions = number / 1000000000;
      return '${billions.toStringAsFixed(2)}B';
    } else if (number >= 1000000) {
      double millions = number / 1000000;
      return '${millions.toStringAsFixed(2)}M';
    } else if (number >= 1000) {
      double thousands = number / 1000;
      return '${thousands.toStringAsFixed(2)}k';
    } else {
      return number.toString();
    }
  }
}
