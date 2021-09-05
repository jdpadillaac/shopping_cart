import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/services/cart_service.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../constants/colors.dart';
import '../../constants/spacing.dart';
import '../../helpers/responsive.dart';
import '../home/home_page.dart';
import '../../../domain/models/product_cart.dart';
import '../../bloc/shpping_cart/shopping_cart_bloc.dart';


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
    return BlocProvider(
      create: (context) => CartBloc(
        cartService: context.read<CartService>(),
      ),
      child: const _PageView(),
    );
  }
}

class _PageView extends StatelessWidget {
  const _PageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) async {
          if (state is RegisterError) {
            Flushbar(
              title: 'Error',
              message: 'No se ha podido registrar el carrito',
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
            ).show(context);
          } else if (state is RegisterSuccess) {
            await Flushbar(
              title: 'Completado',
              message: 'El registro se ha completado correctamente',
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.green,
            ).show(context);
            context.read<ShoppingCartBloc>().add(const ResetList());
            HomePage.navigate(context);
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.accent,
              ),
            );
          }

          return SafeArea(
            child: Column(
              children: const [
                _Header(),
                Expanded(
                  child: _ProductList(),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const _BottomBar(),
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
      builder: (BuildContext context, ShoppingCartState state) {
        final bloc = BlocProvider.of<ShoppingCartBloc>(context);
        return SingleChildScrollView(
          child: Column(
            children: List.generate(
              bloc.productList.length,
              (int index) => _CartProduct(
                product: bloc.productList[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
