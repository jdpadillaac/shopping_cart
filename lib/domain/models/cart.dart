import 'package:shopping_cart/domain/models/product_cart.dart';

class RqRegisterCart {
  const RqRegisterCart({
    required this.products,
    required this.status,
    required this.total,
  });

  final String status;
  final List<ProductCart> products;
  final int total;
}
