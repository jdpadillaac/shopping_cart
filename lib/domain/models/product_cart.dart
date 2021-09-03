class ProductCart {
  ProductCart({
    required this.id,
    required this.quantity,
    required this.name,
    required this.image,
    required this.price,
    required this.sku,
  });

  final String id;
  final String name;
  final String sku;
  final String image;
  final String price;
  int quantity;

  static ProductCart? findById(List<ProductCart> list, String id) {
    for (final item in list) {
      if (item.id == id) {
        return item;
      }
    }
  }
}
