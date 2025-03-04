import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/architecture/utils/app_module.dart';
import 'package:realview/features/books/data/data_source/books_api.dart';
import 'package:realview/features/books/data/repo_impl/books_repo_impl.dart';
import 'package:realview/features/books/domain/repo/book_repo.dart';
import 'package:realview/features/books/domain/use_case/get_book_detail_use_case.dart';
import 'package:realview/features/books/domain/use_case/get_books_use_case.dart';
import 'package:realview/features/books/presentation/blocs/book_detail_bloc/book_detail_bloc.dart';
import 'package:realview/features/books/presentation/blocs/books_bloc/books_bloc.dart';
import 'package:realview/features/books/presentation/navigation/books_navigation.dart';
import 'package:realview/features/books/presentation/screens/book_detail_screen.dart';
import 'package:realview/features/books/presentation/screens/books_screen.dart';
import 'package:realview/generic/constants.dart';
import 'package:realview/generic/strings.dart';

class BooksModule extends AppModule {
  @override
  void registerBloc() {
    GetIt.I.registerLazySingleton<BooksBloc>(
      () => BooksBloc(
        getBooksUseCase: GetIt.I.get<GetBooksUseCase>(),
        navigation: GetIt.I.get<BooksNavigation>(),
      ),
    );
    GetIt.I.registerFactory<BookDetailBloc>(
      () => BookDetailBloc(getBookDetailUseCase: GetIt.I.get<GetBookDetailUseCase>()),
    );
  }

  @override
  void registerScreenProviders() {
    GetIt.I.registerFactoryParam<Widget, GoRouterState, BuildContext>(
      (goRouterState, context) => MultiBlocProvider(
        providers: [
          BlocProvider<BooksBloc>.value(value: GetIt.I.get<BooksBloc>()),
          BlocProvider<BookDetailBloc>.value(value: GetIt.I.get<BookDetailBloc>()),
        ],
        child: GetIt.I.get<BooksScreen>(param1: goRouterState, param2: context),
      ),
      instanceName: ScreenNames.books,
    );

    GetIt.I.registerFactoryParam<Widget, GoRouterState, BuildContext>(
      (goRouterState, context) => MultiBlocProvider(
        providers: [BlocProvider<BookDetailBloc>.value(value: GetIt.I.get<BookDetailBloc>())],
        child: GetIt.I.get<BookDetailScreen>(param1: goRouterState, param2: context),
      ),
      instanceName: ScreenNames.bookDetail,
    );
  }

  @override
  void registerDataSource() {
    GetIt.I.registerFactory<BooksApi>(() => BooksApi(App.getDio(endpoint: Strings.apiBaseUrl)));
  }

  @override
  void registerNavigation() {
    GetIt.I.registerFactory<BooksNavigation>(() => const BooksNavigation());
  }

  @override
  void registerRepo() {
    GetIt.I.registerFactory<BooksRepo>(() => BooksRepoImpl(api: GetIt.I.get<BooksApi>()));
  }

  @override
  void registerScreen() {
    GetIt.I.registerFactoryParam<BooksScreen, GoRouterState, BuildContext>(
      (goRouterState, context) => const BooksScreen(),
    );
    GetIt.I.registerFactoryParam<BookDetailScreen, GoRouterState, BuildContext>(
      (goRouterState, context) => BookDetailScreen(isbn13: goRouterState.pathParameters['isbn13']!),
    );
  }

  @override
  void registerUseCase() {
    GetIt.I.registerFactory<GetBooksUseCase>(() => GetBooksUseCase(repo: GetIt.I.get<BooksRepo>()));

    GetIt.I.registerFactory<GetBookDetailUseCase>(
      () => GetBookDetailUseCase(repo: GetIt.I.get<BooksRepo>()),
    );
  }
}
