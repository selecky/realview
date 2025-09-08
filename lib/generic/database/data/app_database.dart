abstract class AppDatabase {
  Future<void> put(String key, Object? value);
  Future<Object?> get(String key);
  Future<void> clear();
  Future<Stream<Object?>> observe(String key);
}
