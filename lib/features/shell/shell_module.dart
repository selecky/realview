import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:realview/architecture/utils/app_module.dart';
import 'package:realview/features/dark_mode/presentation/blocs/dark_mode_bloc.dart';
import 'package:realview/features/shell/presentation/screens/shell_screen.dart';
import 'package:realview/generic/constants.dart';

class ShellModule extends AppModule {
  @override
  void registerBloc() {}

  @override
  void registerDI() {
    GetIt.I.registerFactoryParam<Widget, GoRouterState, Widget>(
      (goRouterState, shellChild) => MultiBlocProvider(
        providers: [BlocProvider<DarkModeBloc>.value(value: GetIt.I.get<DarkModeBloc>())],
        child: GetIt.I.get<ShellScreen>(param1: goRouterState, param2: shellChild),
      ),
      instanceName: ScreenNames.shell,
    );
  }

  @override
  void registerDataSource() {}

  @override
  void registerNavigation() {}

  @override
  void registerRepo() {}

  @override
  void registerScreen() {
    GetIt.I.registerFactoryParam<ShellScreen, GoRouterState, Widget>(
      (goRouterState, shellChild) => ShellScreen(child: shellChild),
    );
  }

  @override
  void registerUseCase() {}
}
