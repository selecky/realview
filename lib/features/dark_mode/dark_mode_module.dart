import 'package:get_it/get_it.dart';
import 'package:realview/architecture/utils/app_module.dart';
import 'package:realview/features/dark_mode/data/data_sources/dark_mode_dao.dart';
import 'package:realview/features/dark_mode/data/repo_impl/dark_mode_repo_impl.dart';
import 'package:realview/features/dark_mode/domain/repo/dark_mode_repo.dart';
import 'package:realview/features/dark_mode/presentation/blocs/dark_mode_bloc.dart';
import 'package:realview/generic/database/data/settings_database.dart';

class DarkModeModule extends AppModule {
  @override
  void registerRepo() {
    GetIt.I.registerFactory<DarkModeRepo>(() => DarkModeRepoImpl(dao: GetIt.I.get<DarkModeDao>()));
  }

  @override
  void registerBloc() {
    GetIt.I.registerLazySingleton<DarkModeBloc>(
      () => DarkModeBloc(repo: GetIt.I.get<DarkModeRepo>()),
    );
  }

  @override
  void registerScreen() {}

  @override
  void registerUseCase() {}

  @override
  void registerScreenProviders() {}

  @override
  void registerDataSource() {
    GetIt.I.registerLazySingleton<DarkModeDao>(
      () => DarkModeDao(settingsDatabase: GetIt.I.get<SettingsDatabase>()),
    );
  }

  @override
  void registerNavigation() {}
}
