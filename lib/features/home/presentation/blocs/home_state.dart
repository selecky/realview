part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

class HomeStateSuccess extends HomeState {
  @override
  List<Object> get props => [];
}
