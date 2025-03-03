import 'package:flutter/material.dart';
import 'package:realview/generic/strings.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(Strings.screen_title_book_detail));
  }
}
