import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_cart/domain/services/cart_service.dart';
import 'package:shopping_cart/ui/bloc/cart/cart_bloc.dart';
import 'package:shopping_cart/ui/bloc/shpping_cart/shopping_cart_bloc.dart';
import 'package:shopping_cart/ui/pages/cart/cart_page.dart';

class MockCartService extends Mock implements CartService {}

class MockCartEvent extends Fake implements CartEvent {}

class MockCartState extends Fake implements CartState {}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  group('Cart page', () {
    late CartBloc cartBloc;
    late RepositoryProvider<CartService> instance;

    setUpAll(() {
      registerFallbackValue<CartEvent>(MockCartEvent());
      registerFallbackValue<CartState>(MockCartState());
    });

    setUp(() {
      cartBloc = MockCartBloc();

      instance = RepositoryProvider<CartService>(
        create: (_) => MockCartService(),
        child: MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ShoppingCartBloc(),
              )
            ],
            child: MaterialApp(
              home: Scaffold(
                body: BlocProvider.value(
                  value: cartBloc,
                  child: const CartPage(),
                ),
              ),
            ),
          ),
        ),
      );
    });

    test('Page exist', () {
      expect(const CartPage(), isA<Widget>());
    });

    testWidgets('Renders a cart page', (WidgetTester tester) async {
      await tester.pumpWidget(instance);
      expect(find.byType(CartPage), findsWidgets);
    });
  });
}
