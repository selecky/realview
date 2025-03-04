import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:realview/generic/constants.dart';

class BooksNavigation {
  const BooksNavigation();

  Future<void> goToBookDetailScreen({required BuildContext context, required String isbn13}) async {
    context.go('/${ScreenNames.books}/${ScreenNames.bookDetail}/$isbn13');
  }
}
