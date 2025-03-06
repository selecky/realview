import 'package:equatable/equatable.dart';

class AuthorsData extends Equatable {
  final String? error;
  final String? total;
  final String? page;
  final List<Author>? authors;

  const AuthorsData({this.error, this.total, this.page, this.authors});

  @override
  List<Object?> get props => [error, total, page, authors];
}

class Author extends Equatable {
  final String? title;
  final String? subtitle;
  final String? isbn13;
  final String? image;
  final String? url;

  const Author({this.title, this.subtitle, this.isbn13, this.image, this.url});

  @override
  List<Object?> get props => [title, subtitle, isbn13, image, url];
}
