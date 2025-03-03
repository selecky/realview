import 'dart:async';

import 'package:realview/features/home/domain/navigation/home_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeNavigation navigation;

  HomeBloc({required this.navigation}) : super(HomeStateSuccess()) {
    on<GoToDetailScreenEvent>(_onGoToDetailScreen);
  }

  Future<void> _onGoToDetailScreen(GoToDetailScreenEvent event, Emitter<HomeState> emit) async {
    await navigation.goToDetailScreen(context: event.context);
  }
}
