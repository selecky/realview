import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:realview/generic/strings.dart';

class BookDetailErrorWidget extends StatelessWidget {
  const BookDetailErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          Strings.error__get_book_detail.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
