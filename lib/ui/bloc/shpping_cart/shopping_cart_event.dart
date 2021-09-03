part of 'shopping_cart_bloc.dart';

@immutable
abstract class ShoppingCartEvent extends Equatable {}

class GetProducts extends ShoppingCartEvent {
  @override
  List<Object?> get props => [];
}

class AddProduct extends ShoppingCartEvent {
  AddProduct({
    required this.product,
    required this.quantity,
  });

  final Product product;
  final int quantity;

  @override
  List<Object?> get props => [product, quantity];
}
