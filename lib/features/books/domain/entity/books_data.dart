import 'package:equatable/equatable.dart';

class BooksData extends Equatable {
  final String? error;
  final String? total;
  final String? page;
  final List<Book>? books;

  const BooksData({this.error, this.total, this.page, this.books});

  @override
  List<Object?> get props => [error, total, page, books];
}

class Book extends Equatable {
  final String? title;
  final String? subtitle;
  final String? isbn13;
  final String? image;
  final String? url;

  const Book({this.title, this.subtitle, this.isbn13, this.image, this.url});

  @override
  List<Object?> get props => [title, subtitle, isbn13, image, url];
}
