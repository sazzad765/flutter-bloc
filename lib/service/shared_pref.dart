abstract class SharePref {
  String? getTheme();

  String? getToken();

  int? getUserId();

  Future<void> setTheme(String value);

  Future<void> setSession({required String token, required int userId});

  Future<void> removeSession();
}
