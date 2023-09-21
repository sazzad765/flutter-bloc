import 'package:bloc_example/service/shared_pref.dart';
import 'package:get_storage/get_storage.dart';

class SharePrefImpl extends SharePref {
  final _sharedPref = GetStorage();
  static const _kThemeKey = '__theme_key__';

  @override
  String getTheme() {
    return _sharedPref.read(_kThemeKey);
  }

  @override
  Future<void> setTheme(String value) async {
    _sharedPref.write(_kThemeKey, value);
  }
}
