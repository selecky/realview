import 'package:realview/features/authors/data/dto/author_detail_dto.dart';
import 'package:realview/features/authors/domain/entity/author_detail.dart';

extension AuthorDetailDtoConverter on AuthorDetailDto {
  AuthorDetail toDomain() {
    return AuthorDetail(
      error: error,
      title: title,
      subtitle: subtitle,
      authors: authors,
      publisher: publisher,
      language: language,
      isbn10: isbn10,
      isbn13: isbn13,
      pages: pages,
      year: year,
      rating: rating,
      desc: desc,
      price: price,
      image: image,
      url: url,
      pdf: pdf,
    );
  }
}
