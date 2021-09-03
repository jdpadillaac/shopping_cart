part of 'shopping_cart_bloc.dart';

@immutable
abstract class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();
}

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

class AddProductQuantity extends ShoppingCartEvent {
  const AddProductQuantity({
    required this.productId,
  });

  final String productId;

  @override
  List<Object?> get props => [productId];
}

class ReduceQuantity extends ShoppingCartEvent {
  const ReduceQuantity({
    required this.productId,
  });

  final String productId;

  @override
  List<Object?> get props => [productId];
}

class ProductDeleted extends ShoppingCartEvent {
  const ProductDeleted({
    required this.productId,
  });

  final String productId;

  @override
  List<Object?> get props => [productId];
}
