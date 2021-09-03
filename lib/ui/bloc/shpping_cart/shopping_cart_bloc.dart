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

  List<ProductCart> productList = <ProductCart>[];

  @override
  Stream<ShoppingCartState> mapEventToState(
    ShoppingCartEvent event,
  ) async* {
    if (event is AddProduct) {
      yield* _mapAddProductToState(event);
    } else if (event is GetProducts) {
      yield ProductAdded(products: productList);
    } else if (event is AddProductQuantity) {
      yield* _mapAddProductQuantityToState(event);
    } else if (event is ReduceQuantity) {
      yield* _mapReduceQuantityToState(event);
    } else if (event is ProductDeleted) {
      yield* _mapProductDeletedToState(event.productId);
    }
  }

  Stream<ShoppingCartState> _mapProductDeletedToState(String productId) async* {
    final founded = ProductCart.findById(productList, productId);
    if (founded !=  null) {
      productList.remove(founded);
    }
    yield ProductAdded(products: [...productList]);
  }

  Stream<ShoppingCartState> _mapAddProductQuantityToState(
      AddProductQuantity event) async* {
    List<ProductCart> newList = <ProductCart>[];
    newList = [...productList];
    if (newList.isNotEmpty) {
      for (ProductCart item in newList) {
        if (item.id == event.productId) {
          item.quantity = item.quantity + 1;
        }
      }
      productList = [...newList];
      yield ProductAdded(products: newList);
    }
  }

  Stream<ShoppingCartState> _mapAddProductToState(AddProduct event) async* {
    final newList = [...productList];
    ProductCart? founded;

    if (newList.isNotEmpty) {
      founded = ProductCart.findById(newList, event.product.id);
    }

    if (founded == null) {
      newList.add(
        ProductCart(
          id: event.product.id,
          quantity: event.quantity,
          name: event.product.name,
          image: event.product.image,
          price: event.product.price,
          sku: event.product.sku,
        ),
      );
      productList = newList;
      yield ProductAdded(products: newList);
    }
  }

  Stream<ShoppingCartState> _mapReduceQuantityToState(
      ReduceQuantity event) async* {
    final newList = [...productList];
    for (ProductCart item in newList) {
      if (item.id == event.productId) {
        if (item.quantity > 0) {
          item.quantity = item.quantity - 1;
        }
      }
    }
    productList = newList;
    yield ProductAdded(products: newList);
  }
}
