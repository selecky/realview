import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/features/books/domain/entity/book_detail.dart';
import 'package:realview/features/books/presentation/blocs/book_detail_bloc/book_detail_bloc.dart';
import 'package:realview/features/books/presentation/widgets/book_detail_screen/book_detail_error_widget.dart';
import 'package:realview/generic/strings.dart';
import 'package:realview/generic/widgets/app_progress.dart';
import 'package:realview/generic/widgets/app_screen.dart';

class BookDetailScreen extends StatefulWidget {
  final String isbn13;

  const BookDetailScreen({super.key, required this.isbn13});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  void initState() {
    context.read<BookDetailBloc>().add(GetBookDetailEvent(isbn13: widget.isbn13));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: Strings.screen_title_book_detail.tr(),
      child: BlocBuilder<BookDetailBloc, BookDetailState>(
        builder: (context, state) {
          switch (state) {
            case final BookDetailStateSuccess stateSuccess:
              if (stateSuccess.isLoading) {
                return const Expanded(child: AppProgress());
              } else if (stateSuccess.bookDetail == null) {
                return const BookDetailErrorWidget();
              } else {
                final BookDetail bookDetail = stateSuccess.bookDetail!;
                return Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title: ${bookDetail.title ?? "N/A"}'),
                        Text('Subtitle: ${bookDetail.subtitle ?? "N/A"}'),
                        Text('Authors: ${bookDetail.authors ?? "N/A"}'),
                        Text('Publisher: ${bookDetail.publisher ?? "N/A"}'),
                        Text('Language: ${bookDetail.language ?? "N/A"}'),
                        Text('ISBN-10: ${bookDetail.isbn10 ?? "N/A"}'),
                        Text('ISBN-13: ${bookDetail.isbn13 ?? "N/A"}'),
                        Text('Pages: ${bookDetail.pages?.toString() ?? "N/A"}'),
                        Text('Year: ${bookDetail.year?.toString() ?? "N/A"}'),
                        Text('Rating: ${bookDetail.rating?.toString() ?? "N/A"}'),
                        Text('Description: ${bookDetail.desc ?? "N/A"}'),
                        Text('Price: ${bookDetail.price ?? "N/A"}'),
                        Text('URL: ${bookDetail.url ?? "N/A"}'),
                        if (bookDetail.image != null)
                          Image.network(bookDetail.image!, height: 150, width: 100),
                        if (bookDetail.pdf != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                bookDetail.pdf!.entries.map((entry) {
                                  return Text('${entry.key}: ${entry.value}');
                                }).toList(),
                          ),
                      ],
                    ),
                  ),
                );
              }
            case BookDetailStateError():
              return const BookDetailErrorWidget();
          }
        },
      ),
    );
  }
}
