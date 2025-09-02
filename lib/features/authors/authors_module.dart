import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/architecture/utils/app_module.dart';
import 'package:realview/features/authors/data/data_source/authors_api.dart';
import 'package:realview/features/authors/data/repo_impl/authors_repo_impl.dart';
import 'package:realview/features/authors/domain/repo/authors_repo.dart';
import 'package:realview/features/authors/domain/use_case/get_authors_use_case.dart';
import 'package:realview/features/authors/presentation/blocs/authors_bloc/authors_bloc.dart';
import 'package:realview/features/authors/presentation/navigation/authors_navigation.dart';
import 'package:realview/features/authors/presentation/screens/authors_screen.dart';
import 'package:realview/generic/constants.dart';
import 'package:realview/generic/strings.dart';

class AuthorsModule extends AppModule {
  @override
  void registerBloc() {
    GetIt.I.registerFactory<AuthorsBloc>(
      () => AuthorsBloc(
        getAuthorsUseCase: GetIt.I.get<GetAuthorsUseCase>(),
        authorsNavigation: GetIt.I.get<AuthorsNavigation>(),
      ),
    );
  }

  @override
  void registerScreenProviders() {
    GetIt.I.registerFactoryParam<Widget, GoRouterState, BuildContext>(
      (goRouterState, context) => MultiBlocProvider(
        providers: [BlocProvider<AuthorsBloc>(create: (blocContext) => GetIt.I.get<AuthorsBloc>())],
        child: GetIt.I.get<AuthorsScreen>(param1: goRouterState, param2: context),
      ),
      instanceName: ScreenNames.authors,
    );
  }

  @override
  void registerDataSource() {
    GetIt.I.registerFactory<AuthorsApi>(
      () => AuthorsApi(App.getDio(endpoint: Strings.api_base_url)),
    );
  }

  @override
  void registerNavigation() {
    GetIt.I.registerFactory<AuthorsNavigation>(AuthorsNavigation.new);
  }

  @override
  void registerRepo() {
    GetIt.I.registerFactory<AuthorsRepo>(() => AuthorsRepoImpl(api: GetIt.I.get<AuthorsApi>()));
  }

  @override
  void registerScreen() {
    GetIt.I.registerFactoryParam<AuthorsScreen, GoRouterState, BuildContext>(
      (goRouterState, context) => const AuthorsScreen(),
    );
  }

  @override
  void registerUseCase() {
    GetIt.I.registerFactory<GetAuthorsUseCase>(
      () => GetAuthorsUseCase(repo: GetIt.I.get<AuthorsRepo>()),
    );
  }
}
