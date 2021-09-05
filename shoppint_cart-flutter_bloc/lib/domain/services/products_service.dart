
import '../models/product.dart';

abstract class ProductService {
  Future<List<Product>> getList();
}