import 'dart:async';

import 'package:bloc_example/view/theme/repo/theme_repository.dart';
import 'package:get_storage/get_storage.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl() {
    _init();
  }

  final _sharedPref = GetStorage();

  static const _kThemePersistenceKey = '__theme_persistence_key__';

  final _controller = StreamController<CustomTheme>();

  String? _getValue(String key) {
    try {
      return _sharedPref.read(key);
    } catch (_) {
      return null;
    }
  }

  Future<void> _setValue(String key, String value) =>
      _sharedPref.write(key, value);

  void _init() {
    final themeString = _getValue(_kThemePersistenceKey);
    if (themeString != null) {
      if (themeString == CustomTheme.light.name) {
        _controller.add(CustomTheme.light);
      } else {
        _controller.add(CustomTheme.dark);
      }
    } else {
      _controller.add(CustomTheme.light);
    }
  }

  @override
  Stream<CustomTheme> getTheme() => _controller.stream;

  @override
  Future<void> saveTheme(CustomTheme theme) {
    _controller.add(theme);
    return _setValue(_kThemePersistenceKey, theme.name);
  }

  @override
  void dispose() => _controller.close();
}
