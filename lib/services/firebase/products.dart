import 'package:shopping_cart/domain/models/product.dart';
import 'package:shopping_cart/domain/services/products_service.dart';

class FrProductService extends ProductService {
  @override
  Future<List<Product>> getList() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      Product(
        id: 'thrafgaer',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        name: 'Producto 1',
        image:
            'https://s3.us-east-1.amazonaws.com/laikapp/images_products/99346b7c2a33b3d7886aec3eafb1f65b.png',
        price: 6500,
        sku: 'aaaaeeee',
      ),
      Product(
        id: 'aswergwerasdasd',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        name: 'Producto 2',
        image:
            'https://s3.us-east-1.amazonaws.com/laikapp/images_products/99346b7c2a33b3d7886aec3eafb1f65b.png',
        price: 6500,
        sku: 'aaaaeeee',
      ),
      Product(
        id: 'asdasdf53245asd',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        name: 'Producto 3',
        image:
            'https://s3.us-east-1.amazonaws.com/laikapp/images_products/99346b7c2a33b3d7886aec3eafb1f65b.png',
        price: 6500,
        sku: 'aaaaeeee',
      ),
      Product(
        id: 'asd234562346asd',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        name: 'Producto 4',
        image:
            'https://s3.us-east-1.amazonaws.com/laikapp/images_products/99346b7c2a33b3d7886aec3eafb1f65b.png',
        price: 6500,
        sku: 'aaaaeeee',
      ),
      Product(
        id: '89078906785',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        name: 'Producto 5',
        image:
            'https://s3.us-east-1.amazonaws.com/laikapp/images_products/99346b7c2a33b3d7886aec3eafb1f65b.png',
        price: 6500,
        sku: 'aaaaeeee',
      )
    ];
  }
}
