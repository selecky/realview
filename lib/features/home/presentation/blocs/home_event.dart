part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GoToBooksScreenEvent extends HomeEvent {
  const GoToBooksScreenEvent({required this.context});

  final BuildContext context;

  @override
  List<Object?> get props => [context];
}
