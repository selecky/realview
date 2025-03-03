// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksDataDto _$BooksDataDtoFromJson(Map<String, dynamic> json) => BooksDataDto(
  error: json['error'] as String?,
  total: json['total'] as String?,
  page: json['page'] as String?,
  books:
      (json['books'] as List<dynamic>?)
          ?.map((e) => BookDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$BooksDataDtoToJson(BooksDataDto instance) =>
    <String, dynamic>{
      'error': instance.error,
      'total': instance.total,
      'page': instance.page,
      'books': instance.books?.map((e) => e.toJson()).toList(),
    };

BookDto _$BookDtoFromJson(Map<String, dynamic> json) => BookDto(
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
  isbn13: json['isbn13'] as String?,
  image: json['image'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$BookDtoToJson(BookDto instance) => <String, dynamic>{
  'title': instance.title,
  'subtitle': instance.subtitle,
  'isbn13': instance.isbn13,
  'image': instance.image,
  'url': instance.url,
};
