import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_cart/domain/models/product.dart';
import 'package:shopping_cart/ui/bloc/shpping_cart/shopping_cart_bloc.dart';

class MockProduct extends Fake implements Product {}

void main() {
  final bloc = ShoppingCartBloc();

  setUp(() {
    registerFallbackValue(MockProduct());
  });

  group('Sooping cart test', () {
    test('initial state', () {
      ShoppingCartBloc();
      ShoppingCartInitial();
    });

    group('description', () {
      blocTest(
        '',
        build: () {
          when(() => bloc.add(AddProduct(product: any(), quantity: 2)));
          return bloc;
        },
        expect: () => [
          const ProductAdded(products: []),
        ],
      );
    });
  });
}
