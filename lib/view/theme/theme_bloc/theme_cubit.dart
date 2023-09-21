import 'dart:async';

import 'package:bloc_example/service/injection_service.dart';
import 'package:bloc_example/utils/custom_themes.dart';
import 'package:bloc_example/view/theme/repo/theme_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  final _repo = di.get<ThemeRepository>();
  late StreamSubscription<CustomTheme> _themeSubscription;



  void getCurrentTheme() {
    _themeSubscription = _repo.getTheme().listen(
      (customTheme) {
        if (customTheme.name == CustomTheme.light.name) {
          emit(state.copyWith(themeMode: ThemeMode.light));
        } else {
          emit(state.copyWith(themeMode: ThemeMode.dark));
        }
      },
    );
  }

  void switchTheme() {

    if (state.themeMode == ThemeMode.dark) {
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
