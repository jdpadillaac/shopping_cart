part of 'shopping_cart_bloc.dart';

@immutable
abstract class ShoppingCartState extends Equatable {}

class ShoppingCartInitial extends ShoppingCartState {
  @override
  List<Object?> get props => [];
}

class ProductAdded extends ShoppingCartState {
  ProductAdded({
    required this.products,
  });

  final List<ProductCart> products;

  @override
  List<Object?> get props => [products];
}
