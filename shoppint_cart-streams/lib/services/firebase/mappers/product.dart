import '../../../domain/models/product.dart';
import '../../../domain/shared/mapper.dart';

class FrProductMapper extends Mapper<Product> {
  @override
  Product fromJson(Map<String, dynamic> json) {
    return Product(
        description: json['description'],
        id: json['id'],
        image: json['image'],
        name: json['name'],
        price: json['price'],
        sku: json['sku']);
  }

  @override
  Map<String, dynamic> toJson(Product data) {
    throw UnimplementedError();
  }
}
