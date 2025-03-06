import 'package:realview/features/authors/data/dto/authors_data_dto.dart';
import 'package:realview/features/authors/domain/entity/authors_data.dart';

extension AuthorsDataDtoConverter on AuthorsDataDto {
  AuthorsData toDomain() {
    return AuthorsData(
      error: error,
      total: total,
      page: page,
      authors: authors?.map((e) => e.toDomain()).toList(),
    );
  }
}

extension AuthorDtoConverter on AuthorDto {
  Author toDomain() {
    return Author(title: title, subtitle: subtitle, isbn13: isbn13, image: image, url: url);
  }
}
