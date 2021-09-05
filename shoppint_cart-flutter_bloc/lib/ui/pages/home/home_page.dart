import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/colors.dart';
import '../../constants/spacing.dart';
import '../../../domain/models/product.dart';
import '../../../domain/models/product_cart.dart';
import '../../../domain/services/products_service.dart';
import '../../bloc/home/home_bloc.dart';
import '../../bloc/shpping_cart/shopping_cart_bloc.dart';
import '../../helpers/responsive.dart';
import '../cart/cart_page.dart';
import '../../shared/overlay.dart';

part 'widgets/product.dart';

part 'widgets/overlay_body.dart';

part 'widgets/cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static void navigate(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        productService: context.read<ProductService>(),
      )..add(const LoadData()),
      child: const _PageView(),
    );
  }
}

class _PageView extends StatelessWidget {
  const _PageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primary),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Productos',
          style: TextStyle(color: AppColors.primary),
        ),
        actions: const [_HomeCart()],
      ),
      drawer: Container(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
          if (state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else if (state is LoadedProducts) {
            return _ProductList(products: state.products);
          } else if (state is QueryError) {
            return const SizedBox.shrink();
          } else {
            return const SizedBox.shrink();
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
