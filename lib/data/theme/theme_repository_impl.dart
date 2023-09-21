import 'dart:async';

import 'package:bloc_example/service/shared_pref.dart';
import 'package:bloc_example/view/theme/repo/theme_repository.dart';
import 'package:get_storage/get_storage.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl({required SharePref sharedPref})
      : _sharedPref = sharedPref {
    _init();
  }

  final SharePref _sharedPref;

  final _controller = StreamController<CustomTheme>();

  String? _getValue() {
    try {
      return _sharedPref.getTheme();
    } catch (_) {
      return null;
    }
  }

  Future<void> _setValue(String value) => _sharedPref.setTheme(value);

  void _init() {
    final themeString = _getValue();
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
    return _setValue(theme.name);
  }

  @override
  void dispose() => _controller.close();
}
