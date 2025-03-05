part of 'book_detail_bloc.dart';

sealed class BookDetailState extends Equatable {
  const BookDetailState();
}

class BookDetailStateLoading extends BookDetailState {
  const BookDetailStateLoading();

  @override
  List<Object> get props => [];
}

class BookDetailStateSuccess extends BookDetailState {
  final BookDetail? bookDetail;

  const BookDetailStateSuccess({required this.bookDetail});

  @override
  List<Object?> get props => [bookDetail];
}

class BookDetailStateError extends BookDetailState {
  final String errorMessage;

  const BookDetailStateError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
