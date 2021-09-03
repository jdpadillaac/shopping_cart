class ProductCart {
  const ProductCart({
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
  final int quantity;
}
