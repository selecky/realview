import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/features/books/domain/entity/books_data.dart';
import 'package:realview/features/books/domain/entity/result_entity/get_books_result.dart';
import 'package:realview/features/books/domain/use_case/get_books_use_case.dart';
import 'package:realview/features/books/presentation/navigation/books_navigation.dart';
import 'package:realview/generic/strings.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetBooksUseCase getBooksUseCase;
  final BooksNavigation navigation;

  BooksBloc({required this.getBooksUseCase, required this.navigation})
    : super(const BooksStateLoading()) {
    on<GetBooksEvent>(_onGetBooksEvent);
    on<GoToBookDetailScreenEvent>(_onGoToBookDetailScreenEvent);
  }

  Future<void> _onGetBooksEvent(GetBooksEvent event, Emitter<BooksState> emit) async {
    emit(const BooksStateLoading());
    final GetBooksResult result = await getBooksUseCase.call(params: event.keyword);
    switch (result) {
      case final ResultSuccess success:
        emit(BooksStateSuccess(booksData: success.booksData));
      case ResultFailure():
        emit(BooksStateError(errorMessage: Strings.error__get_books.tr()));
    }
  }

  Future<void> _onGoToBookDetailScreenEvent(
    GoToBookDetailScreenEvent event,
    Emitter<BooksState> emit,
  ) async {
    await navigation.goToBookDetailScreen(context: event.context, isbn13: event.isbn13);
  }
}
