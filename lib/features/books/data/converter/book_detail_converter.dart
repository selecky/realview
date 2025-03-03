import 'package:realview/features/books/data/dto/book_detail_dto.dart';
import 'package:realview/features/books/domain/entity/book_detail.dart';

extension BookDetailDtoConverter on BookDetailDto {
  BookDetail toDomain() {
    return BookDetail(
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
