import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/models/cart.dart';
import '../../../domain/services/cart_service.dart';

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
