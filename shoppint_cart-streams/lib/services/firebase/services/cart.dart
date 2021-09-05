import 'package:cloud_firestore/cloud_firestore.dart';
import 'product_carts.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/models/cart.dart';
import '../../../domain/services/cart_service.dart';

class FrCartService extends CartService {
  final _collectionReference = FirebaseFirestore.instance.collection('carts');
  final _cartProductsService = FrProductCarts();

  @override
  Future<void> save(RqRegisterCart data) async {
    try {
      final id = const Uuid().v1();
      await _collectionReference.doc(id).set({
        'status': data.status,
        'total': data.total,
      });

      await _cartProductsService.saveArray(id, data.products);
      return;
    } catch (e) {
      rethrow;
    }
  }
}
