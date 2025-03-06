import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/features/authors/domain/entity/author_detail.dart';
import 'package:realview/features/authors/presentation/blocs/author_detail_bloc/author_detail_bloc.dart';
import 'package:realview/features/authors/presentation/widgets/author_detail_screen/author_detail_error_widget.dart';
import 'package:realview/generic/strings.dart';
import 'package:realview/generic/widgets/app_progress.dart';
import 'package:realview/generic/widgets/app_screen.dart';

class AuthorDetailScreen extends StatefulWidget {
  final String isbn13;

  const AuthorDetailScreen({super.key, required this.isbn13});

  @override
  State<AuthorDetailScreen> createState() => _AuthorDetailScreenState();
}

class _AuthorDetailScreenState extends State<AuthorDetailScreen> {
  @override
  void initState() {
    context.read<AuthorDetailBloc>().add(GetAuthorDetailEvent(isbn13: widget.isbn13));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: Strings.screen_title_author_detail.tr(),
      child: BlocBuilder<AuthorDetailBloc, AuthorDetailState>(
        builder: (context, state) {
          switch (state) {
            case AuthorDetailStateLoading():
              return const Expanded(child: AppProgress());
            case final AuthorDetailStateSuccess stateSuccess:
              if (stateSuccess.authorDetail == null) {
                return const AuthorDetailErrorWidget();
              } else {
                final AuthorDetail authorDetail = stateSuccess.authorDetail!;
                return Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title: ${authorDetail.title ?? "N/A"}'),
                        Text('Subtitle: ${authorDetail.subtitle ?? "N/A"}'),
                        Text('Authors: ${authorDetail.authors ?? "N/A"}'),
                        Text('Publisher: ${authorDetail.publisher ?? "N/A"}'),
                        Text('Language: ${authorDetail.language ?? "N/A"}'),
                        Text('ISBN-10: ${authorDetail.isbn10 ?? "N/A"}'),
                        Text('ISBN-13: ${authorDetail.isbn13 ?? "N/A"}'),
                        Text('Pages: ${authorDetail.pages?.toString() ?? "N/A"}'),
                        Text('Year: ${authorDetail.year?.toString() ?? "N/A"}'),
                        Text('Rating: ${authorDetail.rating?.toString() ?? "N/A"}'),
                        Text('Description: ${authorDetail.desc ?? "N/A"}'),
                        Text('Price: ${authorDetail.price ?? "N/A"}'),
                        Text('URL: ${authorDetail.url ?? "N/A"}'),
                        if (authorDetail.image != null)
                          Image.network(authorDetail.image!, height: 150, width: 100),
                        if (authorDetail.pdf != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                authorDetail.pdf!.entries.map((entry) {
                                  return Text('${entry.key}: ${entry.value}');
                                }).toList(),
                          ),
                      ],
                    ),
                  ),
                );
              }
            case AuthorDetailStateError():
              return const AuthorDetailErrorWidget();
          }
        },
      ),
    );
  }
}
