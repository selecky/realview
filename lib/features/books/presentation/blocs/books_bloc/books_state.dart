part of 'books_bloc.dart';

sealed class BooksState extends Equatable {
  const BooksState();
}

class BooksStateLoading extends BooksState {
  const BooksStateLoading();

  @override
  List<Object> get props => [];
}

class BooksStateSuccess extends BooksState {
  final BooksData? booksData;

  const BooksStateSuccess({required this.booksData});

  @override
  List<Object?> get props => [booksData];
}

class BooksStateError extends BooksState {
  final String errorMessage;

  const BooksStateError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
