import 'package:shopping_cart/domain/models/product.dart';
import 'package:shopping_cart/domain/services/products_service.dart';

class FrProductService extends ProductService {
  @override
  Future<List<Product>> getList() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      Product(
        id: 'asdasd',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        name: 'Producto 1',
        image:
            'https://s3.us-east-1.amazonaws.com/laikapp/images_products/99346b7c2a33b3d7886aec3eafb1f65b.png',
        price: '1.500',
        sku: 'aaaaeeee',
      ),
      Product(
        id: 'asdasd',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        name: 'Producto 1',
        image:
            'https://s3.us-east-1.amazonaws.com/laikapp/images_products/99346b7c2a33b3d7886aec3eafb1f65b.png',
        price: '2.500',
        sku: 'aaaaeeee',
      ),
      Product(
        id: 'asdasd',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        name: 'Producto 1',
        image:
            'https://s3.us-east-1.amazonaws.com/laikapp/images_products/99346b7c2a33b3d7886aec3eafb1f65b.png',
        price: '3.500',
        sku: 'aaaaeeee',
      ),
      Product(
        id: 'asdasd',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        name: 'Producto 1',
        image:
            'https://s3.us-east-1.amazonaws.com/laikapp/images_products/99346b7c2a33b3d7886aec3eafb1f65b.png',
        price: '6.500',
        sku: 'aaaaeeee',
      ),
      Product(
        id: 'asdasd',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        name: 'Producto 1',
        image:
            'https://s3.us-east-1.amazonaws.com/laikapp/images_products/99346b7c2a33b3d7886aec3eafb1f65b.png',
        price: '2.500',
        sku: 'aaaaeeee',
      )
    ];
  }
}
