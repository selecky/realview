part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GoToAuthorsScreenEvent extends HomeEvent {
  const GoToAuthorsScreenEvent({required this.context});

  final BuildContext context;

  @override
  List<Object?> get props => [context];
}
