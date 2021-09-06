import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_cart/domain/models/product.dart';
import 'package:shopping_cart/ui/bloc/shpping_cart/shopping_cart_bloc.dart';

class MockProduct extends Fake implements Product {}

void main() {
  late ShoppingCartBloc bloc;

  const productTest = Product(
    description: 'asd',
    id: 'asd',
    image: 'asd',
    name: 'asdas',
    price: 10,
    sku: 'asdasd',
  );

  setUp(() {
    registerFallbackValue(MockProduct());
    bloc = ShoppingCartBloc();
  });

  group('Sooping cart test', () {
    test('initial state', () {
      ShoppingCartBloc();
      ShoppingCartInitial();
    });

    group('description', () {
      blocTest<ShoppingCartBloc, ShoppingCartState>(
        'emit [ProductAdded] when new product is added to list',
        build: () {
          when(
            () => bloc.add(
              const AddProduct(
                product: productTest,
                quantity: 2,
              ),
            ),
          );
          return bloc;
        },
        //TO DO verify and expect
      );
    });
  });
}
