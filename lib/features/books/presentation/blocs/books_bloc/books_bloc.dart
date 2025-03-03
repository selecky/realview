import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/architecture/utils/network_result.dart';
import 'package:realview/features/books/domain/entity/books_data.dart';
import 'package:realview/features/books/domain/use_case/get_books_use_case.dart';
import 'package:realview/generic/strings.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetBooksUseCase getBooksUseCase;

  BooksBloc({required this.getBooksUseCase})
    : super(const BooksStateSuccess(isLoading: true, booksData: null)) {
    on<GetBooksEvent>(_onGetBooksEvent);
  }

  Future<void> _onGetBooksEvent(GetBooksEvent event, Emitter<BooksState> emit) async {
    final NetworkResult<BooksData> result = await getBooksUseCase.call(params: event.keyword);
    switch (result) {
      case final NetworkResultSuccess<BooksData> success:
        emit(BooksStateSuccess(isLoading: false, booksData: success.data));
      case NetworkResultFailure<BooksData>():
        emit(BooksStateError(errorMessage: Strings.error__getBooks.tr()));
    }
  }
}
