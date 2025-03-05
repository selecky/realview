import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realview/features/books/domain/entity/books_data.dart';

part 'get_books_result.freezed.dart';

@freezed
class GetBooksResult with _$GetBooksResult {
  const factory GetBooksResult.success({required BooksData booksData}) = ResultSuccess;
  const factory GetBooksResult.failure() = ResultFailure;
}
