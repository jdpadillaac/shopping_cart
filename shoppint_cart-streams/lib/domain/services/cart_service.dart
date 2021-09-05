import '../models/cart.dart';

abstract class CartService {
  Future<void> save(RqRegisterCart data);
}
