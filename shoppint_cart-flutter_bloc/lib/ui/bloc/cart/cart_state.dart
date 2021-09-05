part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  const CartInitial();

  @override
  List<Object?> get props => [];
}

class Loading extends CartState {
  const Loading();

  @override
  List<Object?> get props => [];
}

class Loaded extends CartState {
  const Loaded();

  @override
  List<Object?> get props => [];
}

class RegisterError extends CartState {
  const RegisterError();
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends CartState {
  const RegisterSuccess();
  @override
  List<Object?> get props => [];
}
