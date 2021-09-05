import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/models/cart.dart';
import '../../../domain/models/product_cart.dart';
import '../../../domain/services/cart_service.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({
    required this.cartService,
  }) : super(const CartInitial());

  final CartService cartService;

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CompleteButtonPressed) {
      yield* _mapCompleteButtonPressedToState(event);
    }
  }

  Stream<CartState> _mapCompleteButtonPressedToState(
    CompleteButtonPressed event,
  ) async* {
    yield const Loading();
    int sum = 0;

    for (final item in event.products) {
      sum = sum + (item.quantity * item.price);
    }

    try {
      await cartService.save(
        RqRegisterCart(
          products: event.products,
          status: 'completed',
          total: sum,
        ),
      );
      yield const RegisterSuccess();
    } catch (_) {
      yield const RegisterError();
    }
  }
}
