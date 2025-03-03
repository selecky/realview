import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:realview/architecture/utils/app_module.dart';
import 'package:realview/features/home/domain/navigation/home_navigation.dart';
import 'package:realview/features/home/presentation/blocs/home_bloc.dart';
import 'package:realview/features/home/presentation/screens/home_screen.dart';
import 'package:realview/generic/constants.dart';
import 'package:realview/generic/database/data/app_database_impl.dart';
import 'package:realview/generic/database/data/settings_database.dart';

class HomeModule extends AppModule {
  @override
  void registerBloc() {
    GetIt.I.registerFactory<HomeBloc>(() => HomeBloc(navigation: GetIt.I.get<HomeNavigation>()));
  }

  @override
  void registerScreenProviders() {
    GetIt.I.registerFactoryParam<Widget, GoRouterState, BuildContext>(
      (goRouterState, context) => MultiBlocProvider(
        providers: [BlocProvider<HomeBloc>.value(value: GetIt.I.get<HomeBloc>())],
        child: GetIt.I.get<HomeScreen>(param1: goRouterState, param2: context),
      ),
      instanceName: ScreenNames.home,
    );
  }

  @override
  void registerDataSource() {
    GetIt.I.registerLazySingleton<SettingsDatabase>(
      () => AppDatabaseImpl(databaseName: DatabaseNames.settingsDatabase),
    );
  }

  @override
  void registerNavigation() {
    GetIt.I.registerFactory<HomeNavigation>(() => const HomeNavigation());
  }

  @override
  void registerRepo() {}

  @override
  void registerScreen() {
    GetIt.I.registerFactoryParam<HomeScreen, GoRouterState, BuildContext>(
      (goRouterState, context) => const HomeScreen(),
    );
  }

  @override
  void registerUseCase() {}
}
