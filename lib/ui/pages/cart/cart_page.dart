import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/product_cart.dart';
import '../../bloc/shpping_cart/shopping_cart_bloc.dart';
import '../../contants/colors.dart';
import '../../contants/spacing.dart';

part 'widgets/header.dart';

part 'widgets/product.dart';

part 'widgets/bottom_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  static const String route = 'cart_page';

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, CartPage.route);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ShoppingCartBloc>(context, listen: true);
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const _Header(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      bloc.productList.length,
                      (int index) => _CartProduct(
                        product: bloc.productList[index],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const _BottomBar());
  }
}


