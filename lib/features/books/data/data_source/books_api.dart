import 'package:dio/dio.dart';
import 'package:realview/features/books/data/dto/book_detail_dto.dart';
import 'package:realview/features/books/data/dto/books_data_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'books_api.g.dart';

@RestApi()
abstract class BooksApi {
  factory BooksApi(Dio dio) = _BooksApi;

  @GET('/search/{keyword}')
  Future<BooksDataDto> getBooks({@Path() required String keyword});

  @GET('/books/{isbn13}')
  Future<BookDetailDto> getBookDetail({@Path() required String isbn13});
}
