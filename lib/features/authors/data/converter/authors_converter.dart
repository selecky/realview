import 'package:realview/features/authors/data/dto/authors_data_dto.dart';
import 'package:realview/features/authors/domain/entity/authors_data.dart';

extension AuthorsDataDtoConverter on AuthorsDataDto {
  AuthorsData toDomain() {
    return AuthorsData(
      numFound: numFound,
      start: start,
      numFoundExact: numFoundExact,
      docs: docs?.map((e) => e.toDomain()).toList(),
    );
  }
}

extension AuthorDtoConverter on AuthorDto {
  Author toDomain() {
    return Author(
      key: key,
      name: name,
      birthDate: birthDate,
      alternateNames: alternateNames,
      topSubjects: topSubjects,
      topWork: topWork,
      type: type,
      workCount: workCount,
      ratingsAverage: ratingsAverage,
      ratingsSortable: ratingsSortable,
      ratingsCount: ratingsCount,
      ratingsCount1: ratingsCount1,
      ratingsCount2: ratingsCount2,
      ratingsCount3: ratingsCount3,
      ratingsCount4: ratingsCount4,
      ratingsCount5: ratingsCount5,
      wantToReadCount: wantToReadCount,
      alreadyReadCount: alreadyReadCount,
      currentlyReadingCount: currentlyReadingCount,
      readingLogCount: readingLogCount,
    );
  }
}
