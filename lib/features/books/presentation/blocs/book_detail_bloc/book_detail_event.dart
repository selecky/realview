part of 'book_detail_bloc.dart';

abstract class BookDetailEvent extends Equatable {
  const BookDetailEvent();
}

class GetBookDetailEvent extends BookDetailEvent {
  final String isbn13;

  const GetBookDetailEvent({required this.isbn13});

  @override
  List<Object?> get props => [isbn13];
}
