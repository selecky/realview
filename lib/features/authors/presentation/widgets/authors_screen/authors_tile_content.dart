import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/features/authors/domain/entity/authors_data.dart';
import 'package:realview/features/dark_mode/presentation/blocs/dark_mode_bloc.dart';

class AuthorsTileContent extends StatelessWidget {
  final Author author;
  final int index;

  const AuthorsTileContent({super.key, required this.author, required this.index});

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
                  if (author.name != null)
                    Text(author.name!, style: Theme.of(context).textTheme.labelLarge),
                  if (author.topWork != null)
                    Text(
                      key: UniqueKey(),
                      author.topWork!,
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
