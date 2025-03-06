import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:realview/generic/strings.dart';

class AuthorDetailErrorWidget extends StatelessWidget {
  const AuthorDetailErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          Strings.error__get_author_detail.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
