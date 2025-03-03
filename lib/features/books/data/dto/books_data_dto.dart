import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'books_data_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class BooksDataDto extends Equatable {
  final String? error;
  final String? total;
  final String? page;
  final List<BookDto>? books;

  const BooksDataDto({this.error, this.total, this.page, this.books});

  @override
  List<Object?> get props => [error, total, page, books];

  factory BooksDataDto.fromJson(Map<String, dynamic> json) => _$BooksDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BooksDataDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BookDto extends Equatable {
  final String? title;
  final String? subtitle;
  final String? isbn13;
  final String? image;
  final String? url;

  const BookDto({this.title, this.subtitle, this.isbn13, this.image, this.url});

  @override
  List<Object?> get props => [title, subtitle, isbn13, image, url];

  factory BookDto.fromJson(Map<String, dynamic> json) => _$BookDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BookDtoToJson(this);
}
