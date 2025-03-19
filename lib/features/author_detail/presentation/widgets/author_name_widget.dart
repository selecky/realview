import 'package:flutter/material.dart';

class AuthorNameWidget extends StatelessWidget {
  const AuthorNameWidget({super.key, required this.authorName});

  final String? authorName;

  @override
  Widget build(BuildContext context) {
    if (authorName?.isNotEmpty ?? false) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(authorName!, style: Theme.of(context).textTheme.titleMedium),
      );
    } else {
      return const SizedBox();
    }
  }
}
