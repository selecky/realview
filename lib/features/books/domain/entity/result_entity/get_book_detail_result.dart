import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realview/features/books/domain/entity/book_detail.dart';

part 'get_book_detail_result.freezed.dart';

@freezed
class GetBookDetailResult with _$GetBookDetailResult {
  const factory GetBookDetailResult.success({required BookDetail bookDetail}) = ResultSuccess;
  const factory GetBookDetailResult.failure() = ResultFailure;
}
