part of 'shopping_cart_bloc.dart';

@immutable
abstract class ShoppingCartState   {
  const ShoppingCartState();
}

class ShoppingCartInitial extends ShoppingCartState {
}


class ProductAdded extends ShoppingCartState {
  const ProductAdded({
    required this.products,
  });

  final List<ProductCart> products;

}
