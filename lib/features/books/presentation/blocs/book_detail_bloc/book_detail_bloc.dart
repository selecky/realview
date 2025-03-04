import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/architecture/utils/network_result.dart';
import 'package:realview/features/books/domain/entity/book_detail.dart';
import 'package:realview/features/books/domain/use_case/get_book_detail_use_case.dart';
import 'package:realview/generic/strings.dart';

part 'book_detail_event.dart';
part 'book_detail_state.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  final GetBookDetailUseCase getBookDetailUseCase;

  BookDetailBloc({required this.getBookDetailUseCase})
    : super(const BookDetailStateSuccess(isLoading: true, bookDetail: null)) {
    on<GetBookDetailEvent>(_onGetBookDetailEvent);
  }

  Future<void> _onGetBookDetailEvent(
    GetBookDetailEvent event,
    Emitter<BookDetailState> emit,
  ) async {
    final NetworkResult<BookDetail> result = await getBookDetailUseCase.call(params: event.isbn13);
    switch (result) {
      case final NetworkResultSuccess<BookDetail> success:
        emit(BookDetailStateSuccess(isLoading: false, bookDetail: success.data));
      case NetworkResultFailure<BookDetail>():
        emit(BookDetailStateError(errorMessage: Strings.error__get_book_detail.tr()));
    }
  }
}
