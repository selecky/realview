import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_detail_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class BookDetailDto extends Equatable {
  final int? error;
  final String? title;
  final String? subtitle;
  final String? authors;
  final String? publisher;
  final String? language;
  final String? isbn10;
  final String? isbn13;
  final int? pages;
  final int? year;
  final int? rating;
  final String? desc;
  final String? price;
  final String? image;
  final String? url;
  final Map<String, String>? pdf;

  const BookDetailDto({
    this.error,
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.language,
    this.isbn10,
    this.isbn13,
    this.pages,
    this.year,
    this.rating,
    this.desc,
    this.price,
    this.image,
    this.url,
    this.pdf,
  });

  @override
  List<Object?> get props => [
    error,
    title,
    subtitle,
    authors,
    publisher,
    language,
    isbn10,
    isbn13,
    pages,
    year,
    rating,
    desc,
    price,
    image,
    url,
    pdf,
  ];

  factory BookDetailDto.fromJson(Map<String, dynamic> json) => _$BookDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailDtoToJson(this);
}
