part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CompleteButtonPressed extends CartEvent {
  const CompleteButtonPressed({
    required this.products,
  });
  final List<ProductCart> products;
  @override
  List<Object?> get props => [products];
}
