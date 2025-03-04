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

class GoToBookDetailScreenEvent extends BooksEvent {
  final BuildContext context;
  final String isbn13;

  const GoToBookDetailScreenEvent({required this.context, required this.isbn13});

  @override
  List<Object?> get props => [context, isbn13];
}
