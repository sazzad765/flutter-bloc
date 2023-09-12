import 'package:bloc_example/utils/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(AppTheme.lightMode);

  void changeTheme(AppTheme theme) => emit(theme);
}
