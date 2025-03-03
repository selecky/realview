part of 'books_bloc.dart';

sealed class BooksState extends Equatable {
  const BooksState();
}

class BooksStateSuccess extends BooksState {
  final bool isLoading;
  final BooksData? booksData;

  const BooksStateSuccess({required this.isLoading, required this.booksData});

  @override
  List<Object?> get props => [isLoading, booksData];
}

class BooksStateError extends BooksState {
  final String errorMessage;

  const BooksStateError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
