import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

const String DD_MM_YYYY = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime {
  /// Return a string representing [date] formatted according to our locale
  String format([
    String pattern = DD_MM_YYYY,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;
}
