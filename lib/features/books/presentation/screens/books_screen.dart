import 'package:flutter/material.dart';
import 'package:realview/generic/strings.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(Strings.screen_title_books));
  }
}
