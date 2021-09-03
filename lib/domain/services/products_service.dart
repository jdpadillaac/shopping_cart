
import 'package:shopping_cart/domain/models/product.dart';

abstract class ProductService {
  Future<List<Product>> getList();
}