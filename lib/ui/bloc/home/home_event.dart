part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadData extends HomeEvent {
  const LoadData();
  @override
  List<Object?> get props => [];
}
