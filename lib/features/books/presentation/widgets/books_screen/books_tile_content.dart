import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/features/books/domain/entity/books_data.dart';
import 'package:realview/features/dark_mode/presentation/blocs/dark_mode_bloc.dart';

class BooksTileContent extends StatelessWidget {
  final Book book;
  final int index;

  const BooksTileContent({super.key, required this.book, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text((index + 1).toString()),
        const SizedBox(width: 16),
        Flexible(
          child: BlocBuilder<DarkModeBloc, DarkModeState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (book.title != null)
                    Text(book.title!, style: Theme.of(context).textTheme.labelLarge),
                  if (book.subtitle != null)
                    Text(
                      key: UniqueKey(),
                      book.subtitle!,
                      style: Theme.of(context).textTheme.app_bodyMediumGrey,
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
