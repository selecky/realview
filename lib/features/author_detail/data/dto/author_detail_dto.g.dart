// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorDetailDto _$AuthorDetailDtoFromJson(Map<String, dynamic> json) => AuthorDetailDto(
  personalName: json['personal_name'] as String?,
  birthDate: json['birth_date'] as String?,
  bio: json['bio'] as String?,
  links:
      (json['links'] as List<dynamic>?)
          ?.map((e) => AuthorLinkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AuthorDetailDtoToJson(AuthorDetailDto instance) => <String, dynamic>{
  'personal_name': instance.personalName,
  'birth_date': instance.birthDate,
  'bio': instance.bio,
  'links': instance.links?.map((e) => e.toJson()).toList(),
};

AuthorLinkDto _$AuthorLinkDtoFromJson(Map<String, dynamic> json) =>
    AuthorLinkDto(title: json['title'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$AuthorLinkDtoToJson(AuthorLinkDto instance) => <String, dynamic>{
  'title': instance.title,
  'url': instance.url,
};
