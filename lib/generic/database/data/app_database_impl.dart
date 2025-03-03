import 'package:hive/hive.dart';
import 'package:realview/generic/database/data/app_database.dart';
import 'package:realview/generic/database/data/settings_database.dart';

class AppDatabaseImpl implements AppDatabase, SettingsDatabase {
  AppDatabaseImpl({required String databaseName}) : _hiveBox = Hive.openBox<String?>(databaseName);

  final Future<Box<String?>> _hiveBox;

  @override
  Future<void> clear() async {
    await (await _hiveBox).clear();
  }

  @override
  Future<String?> getString(String key) async {
    return (await _hiveBox).get(key);
  }

  @override
  Future<void> putString(String key, String value) async {
    await (await _hiveBox).put(key, value);
  }

  @override
  Future<Stream<String?>> observeStringOrNull(String key) async {
    final box = await _hiveBox;
    Future.delayed(const Duration(milliseconds: 100), () {
      final value = box.get(key);
      box.put(key, value);
    });
    return box.watch(key: key).map((event) => event.value?.toString());
  }
}
