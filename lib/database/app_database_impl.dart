import 'package:hive/hive.dart';
import 'package:realview/database/app_database.dart';
import 'package:realview/database/settings_database.dart';

/// Implementation backed by Hive
class AppDatabaseImpl implements AppDatabase, SettingsDatabase {
  final String databaseName;
  final Future<Box<Object?>> _box;

  AppDatabaseImpl({required this.databaseName}) : _box = Hive.openBox<Object?>(databaseName);

  @override
  Future<void> put(String key, Object? value) async {
    await (await _box).put(key, value);
  }

  @override
  Future<Object?> get(String key) async {
    return (await _box).get(key);
  }

  @override
  Future<void> clear() async {
    await (await _box).clear();
  }

  @override
  Future<Stream<Object?>> observe(String key) async {
    return (await _box).watch(key: key).map((event) => event.value);
  }
}
