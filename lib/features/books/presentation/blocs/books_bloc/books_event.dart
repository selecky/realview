part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();
}

class GetBooksEvent extends BooksEvent {
  final String keyword;

  const GetBooksEvent({required this.keyword});

  @override
  List<Object?> get props => [keyword];
}
