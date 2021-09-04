import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_cart/domain/models/product.dart';
import 'package:shopping_cart/domain/services/products_service.dart';
import 'package:shopping_cart/services/firebase/mappers/product.dart';

class FrProductService extends ProductService {
  final _mapper = FrProductMapper();

  @override
  Future<List<Product>> getList() async {
    List<Product> productList = [];

    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('products');
      QuerySnapshot products = await collectionReference.get();

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
