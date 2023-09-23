import 'package:bloc_example/service/injection_service.dart';
import 'package:bloc_example/service/shared_pref.dart';
import 'package:bloc_example/utils/theme/custom_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(AppTheme.light);

  final _sharePref = di.get<SharePref>();

  void getCurrentTheme() {
    final theme = _sharePref.getTheme();
    if (theme != null) {
      if (theme == AppTheme.light.name) {
        emit(AppTheme.light);
      } else {
        emit(AppTheme.dark);
      }
    } else {
      emit(AppTheme.light);
    }
  }

  void switchTheme() {
    if (state == AppTheme.dark) {
      _sharePref.setTheme(AppTheme.light.name);
    } else {
      _sharePref.setTheme(AppTheme.dark.name);
    }
    getCurrentTheme();
  }
}
