import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/models/product_cart.dart';

class FrProductCarts {
  final _collectionReference =
      FirebaseFirestore.instance.collection('product_carts');

  Future<void> saveArray(String cartId, List<ProductCart> products) async {
    try {
        for (final product in products) {
      final model = {
        'cart_id': cartId,
        'product_id': product.id,
        'quantity': product.quantity
      };
      await _collectionReference.add(model);
    }
    } catch (e) {
      rethrow;
    }
  }
}
