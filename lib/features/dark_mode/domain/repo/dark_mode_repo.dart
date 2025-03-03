abstract class DarkModeRepo {
  Future<bool?> loadIsDark();
  Future<void> storeIsDark({required bool isDark});
}
