abstract class AppDatabase {
  Future<void> putString(String key, String value);
  Future<String?> getString(String key);
  Future<void> clear();
  Future<Stream<String?>> observeStringOrNull(String key);
}
