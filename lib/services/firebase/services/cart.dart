import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_cart/domain/models/cart.dart';
import 'package:shopping_cart/domain/services/cart_service.dart';

class FrCartService extends CartService {
  final _collectionReference = FirebaseFirestore.instance.collection('carts');

  @override
  Future<void> save(RqRegisterCart data) async {
    try {
      _collectionReference.doc().set({
        'status': data.status,
        'total': data.total,
      });

      return;
    } catch (e) {
      rethrow;
    }
  }
}
