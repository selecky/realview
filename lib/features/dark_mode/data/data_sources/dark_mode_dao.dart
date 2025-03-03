import 'package:realview/generic/database/data/settings_database.dart';

class DarkModeDao {
  DarkModeDao({required this.settingsDatabase});

  static const String keyIsDark = 'key_is_dark';
  final SettingsDatabase settingsDatabase;

  Future<bool?> loadIsDark() async {
    final bool isDark = await settingsDatabase.getString(keyIsDark) == 'true';
    return isDark;
  }

  Future<void> storeIsDark({required bool isDark}) async {
    await settingsDatabase.putString(keyIsDark, isDark.toString());
  }
}
