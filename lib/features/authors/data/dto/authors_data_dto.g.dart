// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorsDataDto _$AuthorsDataDtoFromJson(Map<String, dynamic> json) => AuthorsDataDto(
  error: json['error'] as String?,
  total: json['total'] as String?,
  page: json['page'] as String?,
  authors:
      (json['authors'] as List<dynamic>?)
          ?.map((e) => AuthorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AuthorsDataDtoToJson(AuthorsDataDto instance) => <String, dynamic>{
  'error': instance.error,
  'total': instance.total,
  'page': instance.page,
  'authors': instance.authors?.map((e) => e.toJson()).toList(),
};

AuthorDto _$AuthorDtoFromJson(Map<String, dynamic> json) => AuthorDto(
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
  isbn13: json['isbn13'] as String?,
  image: json['image'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$AuthorDtoToJson(AuthorDto instance) => <String, dynamic>{
  'title': instance.title,
  'subtitle': instance.subtitle,
  'isbn13': instance.isbn13,
  'image': instance.image,
  'url': instance.url,
};
