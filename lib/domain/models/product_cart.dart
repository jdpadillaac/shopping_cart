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
  final int price;
  int quantity;

  ProductCart copyWith({
    String? id,
    String? name,
    String? sku,
    String? image,
    int? price,
    int? quantity,
  }) {
    return ProductCart(
      name: name ?? this.name,
      image: image ?? this.image,
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      sku: sku ?? this.sku,
    );
  }

  static ProductCart? findById(List<ProductCart> list, String id) {
    for (final item in list) {
      if (item.id == id) {
        return item;
      }
    }
  }
}
