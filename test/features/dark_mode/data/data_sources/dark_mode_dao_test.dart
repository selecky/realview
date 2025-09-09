import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:realview/database/settings_database.dart';
import 'package:realview/features/dark_mode/data/data_sources/dark_mode_dao.dart';

import 'dark_mode_dao_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SettingsDatabase>()])
void main() {
  group('DarkModeDao Tests', () {
    late MockSettingsDatabase mockSettingsDatabase;
    late DarkModeDao darkModeDao;

    setUp(() {
      mockSettingsDatabase = MockSettingsDatabase();
      darkModeDao = DarkModeDao(settingsDatabase: mockSettingsDatabase);
    });

    test('loadIsDark returns true when stored value is "true"', () async {
      when(mockSettingsDatabase.get(DarkModeDao.keyIsDark)).thenAnswer((_) async => 'true');

      final result = await darkModeDao.loadIsDark();
      expect(result, true);
    });

    test('storeIsDark stores boolean as string', () async {
      await darkModeDao.storeIsDark(isDark: true);
      verify(mockSettingsDatabase.put(DarkModeDao.keyIsDark, 'true')).called(1);
    });
  });
}
