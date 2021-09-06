import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_cart/domain/services/products_service.dart';
import 'package:shopping_cart/ui/bloc/home/home_bloc.dart';

class MockProductService extends Mock implements ProductService {}

void main() {
  late HomeBloc homeBloc;
  late ProductService productService;

  setUp(() {
    productService = MockProductService();
    homeBloc = HomeBloc(productService: productService);
  });

  group('HomeBloc', () {
    test('Initial state in HomeBloc', () {
      expect(homeBloc.state, const HomeInitial());
    });

    group('Load products for service', () {
      blocTest<HomeBloc, HomeState>(
        'emit [LoadedProducts] when load is success',
        build: () {
          when(() => productService.getList())
              .thenAnswer((_) async => Future.value([]));
          return homeBloc;
        },
        act: (bloc) => bloc.add(const LoadData()),
        expect: () => const <HomeState>[LoadedProducts(products: [])],
      );

      blocTest<HomeBloc, HomeState>(
        'emit [QueryError] when load products fail',
        build: () {
          when(() => productService.getList()).thenThrow('');
          return homeBloc;
        },
        act: (bloc) => bloc.add(const LoadData()),
        expect: () => const <HomeState>[QueryError(errorMessage: '')],
      );
    });
  });
}
