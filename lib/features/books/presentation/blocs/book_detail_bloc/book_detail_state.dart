part of 'book_detail_bloc.dart';

sealed class BookDetailState extends Equatable {
  const BookDetailState();
}

class BookDetailStateSuccess extends BookDetailState {
  final bool isLoading;
  final BookDetail? bookDetail;

  const BookDetailStateSuccess({required this.isLoading, required this.bookDetail});

  @override
  List<Object?> get props => [isLoading, bookDetail];
}

class BookDetailStateError extends BookDetailState {
  final String errorMessage;

  const BookDetailStateError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
