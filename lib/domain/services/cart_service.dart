import 'package:shopping_cart/domain/models/cart.dart';

abstract class CartService {
  Future<void> save(RqRegisterCart data);
}
