import 'package:bloc_example/utils/custom_themes.dart';
import 'package:bloc_example/view/theme/theme_bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeCubit, AppTheme, bool>(
      selector: (state) {
        return state == AppTheme.light;
      },
      builder: (context, state) {
        return Switch(
          value: state,
          activeColor: Colors.white,
          onChanged: (value) {
            context.read<ThemeCubit>().switchTheme();
          },
        );
      },
    );
  }
}
