import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_cart/domain/models/cart.dart';
import 'package:shopping_cart/domain/services/cart_service.dart';
import 'package:shopping_cart/ui/bloc/cart/cart_bloc.dart';

class MockCartService extends Mock implements CartService {}

class RqRegisterCartMock extends Fake implements RqRegisterCart {}

void main() {
  late CartBloc cartBloc;
  late CartService cartService;

  setUp(() {
    registerFallbackValue(RqRegisterCartMock());
    cartService = MockCartService();
    cartBloc = CartBloc(cartService: cartService);
  });

  group('CartBloc', () {
    test('Initial state in cartState', () {
      expect(cartBloc.state, const CartInitial());
    });

    group('Register cart error', () {
      blocTest<CartBloc, CartState>(
        'emit [loading, success] when register success',
        build: () {
          when(() => cartService.save(any()))
              .thenAnswer((_) async => Future.value());
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CompleteButtonPressed(products: [])),
        expect: () => const <CartState>[Loading(), RegisterSuccess()],
      );

      blocTest<CartBloc, CartState>(
        'emit [loading, error] when register fail',
        build: () {
          when(() => cartService.save(any())).thenThrow(Exception('Error!'))
          ;
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CompleteButtonPressed(products: [])),
        expect: () => const <CartState>[Loading(), RegisterError()],
      );
    });
  });
}
