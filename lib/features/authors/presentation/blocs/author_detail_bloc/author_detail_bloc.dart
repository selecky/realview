import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/features/authors/domain/entity/author_detail.dart';
import 'package:realview/features/authors/domain/entity/result_entity/get_author_detail_result.dart';
import 'package:realview/features/authors/domain/use_case/get_author_detail_use_case.dart';
import 'package:realview/generic/strings.dart';

part 'author_detail_event.dart';
part 'author_detail_state.dart';

class AuthorDetailBloc extends Bloc<AuthorDetailEvent, AuthorDetailState> {
  final GetAuthorDetailUseCase getAuthorDetailUseCase;

  AuthorDetailBloc({required this.getAuthorDetailUseCase})
    : super(const AuthorDetailStateLoading()) {
    on<GetAuthorDetailEvent>(_onGetAuthorDetailEvent);
  }

  Future<void> _onGetAuthorDetailEvent(
    GetAuthorDetailEvent event,
    Emitter<AuthorDetailState> emit,
  ) async {
    emit(const AuthorDetailStateLoading());
    final GetAuthorDetailResult result = await getAuthorDetailUseCase.call(params: event.isbn13);
    switch (result) {
      case final ResultSuccess success:
        emit(AuthorDetailStateSuccess(authorDetail: success.authorDetail));
      case ResultFailure():
        emit(AuthorDetailStateError(errorMessage: Strings.error__get_author_detail.tr()));
    }
  }
}
