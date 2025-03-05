import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:realview/features/dark_mode/data/data_sources/dark_mode_dao.dart';
import 'package:realview/features/dark_mode/data/repo_impl/dark_mode_repo_impl.dart';

import 'dark_mode_repo_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DarkModeDao>()])
void main() {
  late MockDarkModeDao mockDao;
  late DarkModeRepoImpl repo;

  setUp(() {
    mockDao = MockDarkModeDao();
    repo = DarkModeRepoImpl(dao: mockDao);
  });

  test('loadIsDark calls dao and returns result', () async {
    when(mockDao.loadIsDark()).thenAnswer((_) async => true);

    final result = await repo.loadIsDark();
    expect(result, true);
  });

  test('storeIsDark calls dao with correct value', () async {
    await repo.storeIsDark(isDark: false);
    verify(mockDao.storeIsDark(isDark: false)).called(1);
  });
}
