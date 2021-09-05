class Product {
  const Product({
    required this.id,
    required this.description,
    required this.name,
    required this.image,
    required this.price,
    required this.sku,
  });

  final String id;
  final String name;
  final String sku;
  final String description;
  final String image;
  final int price;
}
