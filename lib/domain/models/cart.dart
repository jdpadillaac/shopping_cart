import '../services/products_service.dart';

class RqRegisterCart {
  const RqRegisterCart({
    required this.id,
    required this.products,
    required this.status,
    required this.total,
  });

  final String id;
  final String status;
  final List<ProductService> products;
  final int total;
}
