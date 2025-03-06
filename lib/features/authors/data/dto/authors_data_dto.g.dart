// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorsDataDto _$AuthorsDataDtoFromJson(Map<String, dynamic> json) => AuthorsDataDto(
  numFound: (json['numFound'] as num?)?.toInt(),
  start: (json['start'] as num?)?.toInt(),
  numFoundExact: json['numFoundExact'] as bool?,
  docs:
      (json['docs'] as List<dynamic>?)
          ?.map((e) => AuthorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AuthorsDataDtoToJson(AuthorsDataDto instance) => <String, dynamic>{
  'numFound': instance.numFound,
  'start': instance.start,
  'numFoundExact': instance.numFoundExact,
  'docs': instance.docs?.map((e) => e.toJson()).toList(),
};

AuthorDto _$AuthorDtoFromJson(Map<String, dynamic> json) => AuthorDto(
  key: json['key'] as String?,
  name: json['name'] as String?,
  birthDate: json['birth_date'] as String?,
  alternateNames: (json['alternate_names'] as List<dynamic>?)?.map((e) => e as String).toList(),
  topSubjects: (json['top_subjects'] as List<dynamic>?)?.map((e) => e as String).toList(),
  topWork: json['top_work'] as String?,
  type: json['type'] as String?,
  workCount: (json['work_count'] as num?)?.toInt(),
  ratingsAverage: (json['ratings_average'] as num?)?.toDouble(),
  ratingsSortable: (json['ratings_sortable'] as num?)?.toDouble(),
  ratingsCount: (json['ratings_count'] as num?)?.toInt(),
  ratingsCount1: (json['ratings_count1'] as num?)?.toInt(),
  ratingsCount2: (json['ratings_count2'] as num?)?.toInt(),
  ratingsCount3: (json['ratings_count3'] as num?)?.toInt(),
  ratingsCount4: (json['ratings_count4'] as num?)?.toInt(),
  ratingsCount5: (json['ratings_count5'] as num?)?.toInt(),
  wantToReadCount: (json['want_to_read_count'] as num?)?.toInt(),
  alreadyReadCount: (json['already_read_count'] as num?)?.toInt(),
  currentlyReadingCount: (json['currently_reading_count'] as num?)?.toInt(),
  readingLogCount: (json['reading_log_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$AuthorDtoToJson(AuthorDto instance) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
  'birth_date': instance.birthDate,
  'alternate_names': instance.alternateNames,
  'top_subjects': instance.topSubjects,
  'top_work': instance.topWork,
  'type': instance.type,
  'work_count': instance.workCount,
  'ratings_average': instance.ratingsAverage,
  'ratings_sortable': instance.ratingsSortable,
  'ratings_count': instance.ratingsCount,
  'ratings_count1': instance.ratingsCount1,
  'ratings_count2': instance.ratingsCount2,
  'ratings_count3': instance.ratingsCount3,
  'ratings_count4': instance.ratingsCount4,
  'ratings_count5': instance.ratingsCount5,
  'want_to_read_count': instance.wantToReadCount,
  'already_read_count': instance.alreadyReadCount,
  'currently_reading_count': instance.currentlyReadingCount,
  'reading_log_count': instance.readingLogCount,
};
