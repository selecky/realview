import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:realview/features/authors/domain/entity/authors_data.dart';
import 'package:realview/features/authors/presentation/blocs/authors_bloc/authors_bloc.dart';
import 'package:realview/features/authors/presentation/widgets/authors_tile_content.dart';
import 'package:realview/generic/strings.dart';
import 'package:realview/generic/widgets/app_error_widget.dart';
import 'package:realview/generic/widgets/app_list_tile.dart';
import 'package:realview/generic/widgets/app_progress.dart';
import 'package:realview/generic/widgets/app_screen.dart';

final _log = Logger('authors_screen');

class AuthorsScreen extends StatefulWidget {
  const AuthorsScreen({super.key});

  @override
  State<AuthorsScreen> createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {
  @override
  void initState() {
    context.read<AuthorsBloc>().add(const GetAuthorsEvent(keyword: 'Hemingway'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: Strings.screen_title_authors.tr(),
      child: BlocBuilder<AuthorsBloc, AuthorsState>(
        builder: (context, state) {
          switch (state) {
            case AuthorsStateLoading():
              return const Expanded(child: AppProgress());
            case final AuthorsStateSuccess stateSuccess:
              if (stateSuccess.authorsData?.docs?.isEmpty ?? true) {
                return Expanded(
                  child: Center(
                    child: Text(
                      Strings.authors_empty.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                );
              } else {
                return Flexible(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 80),
                    itemCount: stateSuccess.authorsData?.docs?.length,
                    itemBuilder: (context, index) {
                      final Author author = stateSuccess.authorsData!.docs![index];
                      return AppListTile(
                        onTap: () {
                          if (author.key != null) {
                            // context.read<AuthorsBloc>().add(
                            //   GoToAuthorDetailScreenEvent(context: context, isbn13: author.isbn13!),
                            // );
                          }
                          _log.info('author tile tapped');
                        },
                        content: AuthorsTileContent(author: author, index: index),
                      );
                    },
                  ),
                );
              }
            case final AuthorsStateError stateError:
              return Expanded(
                child: Center(
                  child: AppErrorWidget(
                    title: stateError.errorMessage.tr(),
                    errorMessage: stateError.errorMessage,
                    onTryAgain: () {
                      context.read<AuthorsBloc>().add(const GetAuthorsEvent(keyword: 'Hemingway'));
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
