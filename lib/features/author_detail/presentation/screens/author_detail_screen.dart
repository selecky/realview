import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/features/author_detail/domain/entity/author_detail.dart';
import 'package:realview/features/author_detail/presentation/blocs/author_detail_bloc/author_detail_bloc.dart';
import 'package:realview/features/author_detail/presentation/widgets/author_attribute_widget.dart';
import 'package:realview/features/author_detail/presentation/widgets/author_name_widget.dart';
import 'package:realview/utils/strings.dart';
import 'package:realview/common_widgets/app_error_widget.dart';
import 'package:realview/common_widgets/app_progress.dart';
import 'package:realview/common_widgets/app_screen.dart';

class AuthorDetailScreen extends StatefulWidget {
  final String authorId;

  const AuthorDetailScreen({super.key, required this.authorId});

  @override
  State<AuthorDetailScreen> createState() => _AuthorDetailScreenState();
}

class _AuthorDetailScreenState extends State<AuthorDetailScreen> {
  @override
  void initState() {
    context.read<AuthorDetailBloc>().add(GetAuthorDetailEvent(authorId: widget.authorId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: Strings.screen_title_author_detail.tr(),
      child: BlocBuilder<AuthorDetailBloc, AuthorDetailState>(
        builder: (context, state) {
          switch (state) {
            case AuthorDetailStateInit():
            case AuthorDetailStateLoading():
              return const Expanded(child: AppProgress());
            case final AuthorDetailStateSuccess stateSuccess:
              if (stateSuccess.authorDetail == null) {
                return AppErrorWidget(
                  text: Strings.error__get_author_detail.tr(),
                  onTryAgain: () {
                    context.read<AuthorDetailBloc>().add(
                      GetAuthorDetailEvent(authorId: widget.authorId),
                    );
                  },
                );
              } else {
                final AuthorDetail authorDetail = stateSuccess.authorDetail!;
                return Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthorNameWidget(authorName: authorDetail.personalName),
                        AuthorAttributeWidget(
                          authorAttribute: authorDetail.birthDate,
                          leading: Icon(
                            Icons.star,
                            color: App.appTheme.app_textColorGrey,
                            size: 16,
                          ),
                        ),
                        AuthorAttributeWidget(authorAttribute: authorDetail.bio),
                        if (authorDetail.links != null && authorDetail.links!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              const Divider(),
                              ...authorDetail.links!.map((link) {
                                if ((link.title?.isNotEmpty ?? false) &&
                                    (link.url?.isNotEmpty ?? false)) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          link.title!,
                                          style: Theme.of(context).textTheme.labelLarge,
                                        ),
                                        SelectableText(
                                          link.url!,
                                          style: Theme.of(context).textTheme.app_bodyMediumGrey,
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              }),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              }
            case AuthorDetailStateError():
              return AppErrorWidget(
                text: Strings.error__get_author_detail.tr(),
                onTryAgain: () {
                  context.read<AuthorDetailBloc>().add(
                    GetAuthorDetailEvent(authorId: widget.authorId),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
