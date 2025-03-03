part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GoToDetailScreenEvent extends HomeEvent {
  const GoToDetailScreenEvent({required this.context});

  final BuildContext context;

  @override
  List<Object?> get props => [context];
}
