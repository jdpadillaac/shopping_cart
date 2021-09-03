import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/domain/models/product.dart';
import 'package:shopping_cart/domain/models/product_cart.dart';
import 'package:shopping_cart/domain/services/products_service.dart';
import 'package:shopping_cart/ui/bloc/home/home_bloc.dart';
import 'package:shopping_cart/ui/bloc/shpping_cart/shopping_cart_bloc.dart';
import 'package:shopping_cart/ui/contants/colors.dart';
import 'package:shopping_cart/ui/contants/spacing.dart';
import 'package:shopping_cart/ui/shared/overlay.dart';

part 'widgets/product.dart';

part 'widgets/overlay_body.dart';

part 'widgets/cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        productService: context.read<ProductService>(),
      )..add(LoadData()),
      child: _PageView(),
    );
  }
}

class _PageView extends StatelessWidget {
  const _PageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primary),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Productos',
          style: TextStyle(color: AppColors.primary),
        ),
        actions: [_HomeCart()],
      ),
      drawer: Container(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
          if (state is HomeInitial) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else if (state is LoadedProducts) {
            return _ProductList(products: state.products);
          } else if (state is QueryError) {
            return SizedBox.shrink();
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          products.length,
          (index) => _ProductItem(product: products[index]),
        ),
      ),
    );
  }
}

