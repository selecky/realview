import 'package:realview/features/dark_mode/data/data_sources/dark_mode_dao.dart';
import 'package:realview/features/dark_mode/domain/repo/dark_mode_repo.dart';

class DarkModeRepoImpl implements DarkModeRepo {
  DarkModeRepoImpl({required this.dao});

  final DarkModeDao dao;

  @override
  Future<bool?> loadIsDark() {
    return dao.loadIsDark();
  }

  @override
  Future<void> storeIsDark({required bool isDark}) async {
    await dao.storeIsDark(isDark: isDark);
  }
}
