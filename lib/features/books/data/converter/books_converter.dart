import 'package:realview/features/books/data/dto/books_data_dto.dart';
import 'package:realview/features/books/domain/entity/books_data.dart';

extension BooksDataDtoConverter on BooksDataDto {
  BooksData toDomain() {
    return BooksData(
      error: error,
      total: total,
      page: page,
      books: books?.map((e) => e.toDomain()).toList(),
    );
  }
}

extension BookDtoConverter on BookDto {
  Book toDomain() {
    return Book(title: title, subtitle: subtitle, isbn13: isbn13, image: image, url: url);
  }
}
