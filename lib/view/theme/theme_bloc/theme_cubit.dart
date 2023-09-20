import 'dart:async';

import 'package:bloc_example/injection_service.dart';
import 'package:bloc_example/view/theme/repo/theme_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  final _repo = di.get<ThemeRepository>();
  late StreamSubscription<CustomTheme> _themeSubscription;
  static late bool _isDarkTheme;

  void getCurrentTheme() {
    _themeSubscription = _repo.getTheme().listen(
      (customTheme) {
        if (customTheme.name == CustomTheme.light.name) {
          _isDarkTheme = false;
          emit(state.copyWith(themeMode: ThemeMode.light));
        } else {
          _isDarkTheme = true;
          emit(state.copyWith(themeMode: ThemeMode.dark));
        }
      },
    );
  }

  void switchTheme() {
    if (_isDarkTheme) {
      // Since, currentTheme is dark, after switching we want light theme to
      // be persisted.
      _repo.saveTheme(CustomTheme.light);
    } else {
      // Since, currentTheme is light, after switching we want dark theme to
      // be persisted.
      _repo.saveTheme(CustomTheme.dark);
    }
  }

  @override
  Future<void> close() {
    _themeSubscription.cancel();
    _repo.dispose();
    return super.close();
  }
}
