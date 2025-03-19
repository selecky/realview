import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/architecture/utils/app_module.dart';
import 'package:realview/features/author_detail/data/data_source/author_detail_api.dart';
import 'package:realview/features/author_detail/data/repo_impl/author_detail_repo_impl.dart';
import 'package:realview/features/author_detail/domain/repo/author_detail_repo.dart';
import 'package:realview/features/author_detail/domain/use_case/get_author_detail_use_case.dart';
import 'package:realview/features/author_detail/presentation/blocs/author_detail_bloc/author_detail_bloc.dart';
import 'package:realview/features/author_detail/presentation/screens/author_detail_screen.dart';
import 'package:realview/generic/constants.dart';
import 'package:realview/generic/strings.dart';

class AuthorDetailModule extends AppModule {
  @override
  void registerBloc() {
    GetIt.I.registerFactory<AuthorDetailBloc>(
      () => AuthorDetailBloc(getAuthorDetailUseCase: GetIt.I.get<GetAuthorDetailUseCase>()),
    );
  }

  @override
  void registerScreenProviders() {
    GetIt.I.registerFactoryParam<Widget, GoRouterState, BuildContext>(
      (goRouterState, context) => MultiBlocProvider(
        providers: [BlocProvider<AuthorDetailBloc>.value(value: GetIt.I.get<AuthorDetailBloc>())],
        child: GetIt.I.get<AuthorDetailScreen>(param1: goRouterState, param2: context),
      ),
      instanceName: ScreenNames.authorDetail,
    );
  }

  @override
  void registerDataSource() {
    GetIt.I.registerFactory<AuthorDetailApi>(
      () => AuthorDetailApi(App.getDio(endpoint: Strings.api_base_url)),
    );
  }

  @override
  void registerNavigation() {}

  @override
  void registerRepo() {
    GetIt.I.registerFactory<AuthorDetailRepo>(
      () => AuthorDetailRepoImpl(api: GetIt.I.get<AuthorDetailApi>()),
    );
  }

  @override
  void registerScreen() {
    GetIt.I.registerFactoryParam<AuthorDetailScreen, GoRouterState, BuildContext>(
      (goRouterState, context) =>
          AuthorDetailScreen(authorId: goRouterState.pathParameters['authorId']!),
    );
  }

  @override
  void registerUseCase() {
    GetIt.I.registerFactory<GetAuthorDetailUseCase>(
      () => GetAuthorDetailUseCase(repo: GetIt.I.get<AuthorDetailRepo>()),
    );
  }
}
