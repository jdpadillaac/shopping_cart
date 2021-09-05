import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/models/product.dart';
import '../../../domain/services/products_service.dart';
import '../mappers/product.dart';

class FrProductService extends ProductService {
  final _collectionReference =
      FirebaseFirestore.instance.collection('products');
  final _mapper = FrProductMapper();

  @override
  Future<List<Product>> getList() async {
    List<Product> productList = [];

    try {
      QuerySnapshot products = await _collectionReference.get();

      if (products.docs.isNotEmpty) {
        for (final element in products.docs) {
          Map<String, dynamic> data = element.data() as Map<String, dynamic>;
          data['id'] = element.id;
          final product = _mapper.fromJson(data);
          productList.add(product);
        }
      }

      return productList;
    } catch (e) {
      rethrow;
    }
  }
}
