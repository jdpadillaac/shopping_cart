import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shopping_cart/domain/models/product.dart';
import 'package:shopping_cart/domain/models/product_cart.dart';

part 'shopping_cart_event.dart';

part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(ShoppingCartInitial());

  final List<ProductCart> _productList = <ProductCart>[];

  @override
  Stream<ShoppingCartState> mapEventToState(
    ShoppingCartEvent event,
  ) async* {
    if (event is AddProduct) {
      yield* _mapAddProductToState(event);
    } else if (event is GetProducts) {
      yield ProductAdded(products: _productList);
    }
  }

  Stream<ShoppingCartState> _mapAddProductToState(AddProduct event) async* {
    final ProductCart? founded = _productList.firstWhere(
      (element) => element.id == event.product.id
    );
    if (founded == null) {
      _productList.add(
        ProductCart(
          id: event.product.id,
          quantity: event.quantity,
          name: event.product.name,
          image: event.product.image,
          price: event.product.price,
          sku: event.product.sku,
        ),
      );
      yield ProductAdded(products: _productList);
    }
  }
}
