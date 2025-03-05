import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:realview/features/books/domain/entity/books_data.dart';
import 'package:realview/features/books/presentation/blocs/books_bloc/books_bloc.dart';
import 'package:realview/features/books/presentation/widgets/books_screen/books_tile_content.dart';
import 'package:realview/generic/strings.dart';
import 'package:realview/generic/widgets/app_error_widget.dart';
import 'package:realview/generic/widgets/app_list_tile.dart';
import 'package:realview/generic/widgets/app_progress.dart';
import 'package:realview/generic/widgets/app_screen.dart';

final _log = Logger('books_screen');

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  void initState() {
    context.read<BooksBloc>().add(const GetBooksEvent(keyword: 'mongodb'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: Strings.screen_title_books.tr(),
      child: BlocBuilder<BooksBloc, BooksState>(
        builder: (context, state) {
          switch (state) {
            case BooksStateLoading():
              return const Expanded(child: AppProgress());
            case final BooksStateSuccess stateSuccess:
              if (stateSuccess.booksData?.books?.isEmpty ?? true) {
                return Center(
                  child: Text(Strings.books_empty, style: Theme.of(context).textTheme.titleMedium),
                );
              } else {
                return Flexible(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 80),
                    itemCount: stateSuccess.booksData?.books?.length,
                    itemBuilder: (context, index) {
                      final Book book = stateSuccess.booksData!.books![index];
                      return AppListTile(
                        onTap: () {
                          if (book.isbn13 != null) {
                            context.read<BooksBloc>().add(
                              GoToBookDetailScreenEvent(context: context, isbn13: book.isbn13!),
                            );
                          }
                          _log.info('book tile tapped');
                        },
                        content: BooksTileContent(book: book, index: index),
                      );
                    },
                  ),
                );
              }
            case final BooksStateError stateError:
              return Expanded(
                child: Center(
                  child: AppErrorWidget(
                    title: stateError.errorMessage.tr(),
                    errorMessage: stateError.errorMessage,
                    onTryAgain: () {
                      context.read<BooksBloc>().add(const GetBooksEvent(keyword: 'mongodb'));
                    },
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
