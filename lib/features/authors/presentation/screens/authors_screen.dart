import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:realview/features/authors/domain/entity/authors_data.dart';
import 'package:realview/features/authors/presentation/blocs/authors_bloc/authors_bloc.dart';
import 'package:realview/features/authors/presentation/widgets/authors_tile_content.dart';
import 'package:realview/generic/strings.dart';
import 'package:realview/generic/widgets/app_button_text.dart';
import 'package:realview/generic/widgets/app_error_widget.dart';
import 'package:realview/generic/widgets/app_list_tile.dart';
import 'package:realview/generic/widgets/app_progress.dart';
import 'package:realview/generic/widgets/app_screen.dart';
import 'package:realview/generic/widgets/app_text_field.dart';

final _log = Logger('authors_screen');

class AuthorsScreen extends StatefulWidget {
  const AuthorsScreen({super.key});

  @override
  State<AuthorsScreen> createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {
  final TextEditingController _controller = TextEditingController();
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: Strings.screen_title_authors.tr(),
      child: Flexible(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Flexible(
                  child: AppTextField(
                    controller: _controller,
                    title: Strings.author_name.tr(),
                    errorText: errorText,
                  ),
                ),
                const SizedBox(width: 16),
                AppButtonText(
                  text: Strings.search.tr(),
                  onTap: () {
                    final bool isValid = _validateTextField();
                    if (isValid) {
                      context.read<AuthorsBloc>().add(GetAuthorsEvent(keyword: _controller.text));
                    }
                  },
                ),
              ],
            ),
            BlocBuilder<AuthorsBloc, AuthorsState>(
              builder: (context, state) {
                switch (state) {
                  case AuthorsStateInit():
                    return const SizedBox();
                  case AuthorsStateLoading():
                    return const Expanded(child: AppProgress());
                  case final AuthorsStateSuccess stateSuccess:
                    if (stateSuccess.authorsData?.docs?.isEmpty ?? true) {
                      return Expanded(child: Center(child: Text(Strings.authors_empty.tr())));
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
                          text: stateError.errorMessage,
                          onTryAgain: () {
                            context.read<AuthorsBloc>().add(
                              GetAuthorsEvent(keyword: _controller.text),
                            );
                          },
                        ),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _validateTextField() {
    if (_controller.text.isEmpty) {
      setState(() {
        errorText = Strings.error__field_empty.tr();
      });
      return false;
    } else {
      if (errorText != null) {
        setState(() {
          errorText = null;
        });
      }
      return true;
    }
  }
}
