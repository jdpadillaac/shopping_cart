import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shopping_cart/domain/models/product.dart';
import 'package:shopping_cart/domain/services/products_service.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.productService,
  }) : super(const HomeInitial());

  final ProductService productService;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadData) {
      yield* _mapLoadDataToState();
    }
  }

  Stream<HomeState> _mapLoadDataToState() async* {
    try {
      final products = await productService.getList();
      yield LoadedProducts(products: products);
    } catch (e) {
      yield QueryError(errorMessage: e.toString());
    }
  }
}
