import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_cart/domain/services/products_service.dart';
import 'package:shopping_cart/ui/bloc/shpping_cart/shopping_cart_bloc.dart';
import 'package:shopping_cart/ui/pages/home/home_page.dart';

class MockProductService extends Mock implements ProductService {}

void main() {
  group('Home page', () {
    final instance = RepositoryProvider<ProductService>(
      create: (_) => MockProductService(),
      child: MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ShoppingCartBloc(),
            )
          ],
          child: const HomePage(),
        ),
      ),
    );

    test('Page exist', () {
      expect(const HomePage(), isA<Widget>());
    });

    testWidgets('Renders a home page', (WidgetTester tester) async {
      await tester.pumpWidget(instance);
      expect(find.byType(HomePage), findsWidgets);
    });
  });
}
