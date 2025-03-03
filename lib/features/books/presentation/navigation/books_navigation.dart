import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:realview/generic/constants.dart';

class BooksNavigation {
  const BooksNavigation();

  Future<void> goToBookDetail({required BuildContext context}) async {
    context.go('/${ScreenNames.books}/${ScreenNames.bookDetail}');
  }
}
