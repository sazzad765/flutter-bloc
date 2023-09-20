abstract class ThemeRepository {
  Stream<CustomTheme> getTheme();

  Future<void> saveTheme(CustomTheme theme);

  void dispose();
}

enum CustomTheme { light, dark }