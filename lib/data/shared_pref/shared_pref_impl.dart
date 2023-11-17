import 'package:bloc_example/common/service/shared_pref.dart';
import 'package:get_storage/get_storage.dart';

class SharePrefImpl extends SharePref {
  final _sharedPref = GetStorage();
  static const _kThemeKey = '_theme_key_';
  static const _kTokenKey = '_token_key_';
  static const _kUserIdKey = '_user_id_key_';

  @override
  String? getTheme() {
    return _sharedPref.read(_kThemeKey);
  }

  @override
  Future<void> setTheme(String value) async {
    _sharedPref.write(_kThemeKey, value);
  }

  @override
  String? getToken() {
    return _sharedPref.read(_kTokenKey);
  }

  @override
  int? getUserId() {
    return _sharedPref.read(_kUserIdKey);
  }

  @override
  Future<void> setSession({required String token, required int userId}) async {
    _sharedPref.write(_kTokenKey, token);
    _sharedPref.write(_kUserIdKey, userId);
  }

  @override
  Future<void> removeSession() async {
    _sharedPref.remove(_kTokenKey);
    _sharedPref.remove(_kUserIdKey);
  }
}
