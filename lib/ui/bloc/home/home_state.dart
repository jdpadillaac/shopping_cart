part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
  @override
  List<Object?> get props => [];
}

class LoadedProducts extends HomeState {
  const LoadedProducts({required this.products});
  final List<Product> products;

  @override
  List<Object?> get props => [products];
}

class QueryError extends HomeState {
  const QueryError({required this.errorMessage});
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
