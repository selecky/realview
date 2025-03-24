import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/features/authors/domain/entity/authors_data.dart';
import 'package:realview/features/authors/domain/entity/result_entity/get_authors_result.dart';
import 'package:realview/features/authors/domain/use_case/get_authors_use_case.dart';
import 'package:realview/features/authors/presentation/navigation/authors_navigation.dart';
import 'package:realview/generic/strings.dart';

part 'authors_event.dart';
part 'authors_state.dart';

class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {
  final GetAuthorsUseCase getAuthorsUseCase;
  final AuthorsNavigation authorsNavigation;

  AuthorsBloc({required this.getAuthorsUseCase, required this.authorsNavigation})
    : super(const AuthorsStateInit()) {
    on<GetAuthorsEvent>(_onGetAuthorsEvent);
    on<GoToAuthorDetailScreenEvent>(_onGoToAuthorDetailScreenEvent);
    on<ResetBlocEvent>(_onResetBlocEvent);
  }

  Future<void> _onGetAuthorsEvent(GetAuthorsEvent event, Emitter<AuthorsState> emit) async {
    emit(const AuthorsStateLoading());
    final GetAuthorsResult result = await getAuthorsUseCase.call(params: event.keyword);
    switch (result) {
      case final ResultSuccess success:
        emit(AuthorsStateSuccess(authorsData: success.authorsData));
      case ResultFailure():
        emit(AuthorsStateError(errorMessage: Strings.error__get_authors.tr()));
      case ResultConnectionError():
        emit(AuthorsStateError(errorMessage: Strings.error__network.tr()));
    }
  }

  Future<void> _onGoToAuthorDetailScreenEvent(
    GoToAuthorDetailScreenEvent event,
    Emitter<AuthorsState> emit,
  ) async {
    await authorsNavigation.goToAuthorDetailScreen(
      context: event.context,
      authorId: event.authorId,
    );
  }

  Future<void> _onResetBlocEvent(ResetBlocEvent event, Emitter<AuthorsState> emit) async {
    emit(const AuthorsStateInit());
  }
}
