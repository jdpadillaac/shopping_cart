import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/domain/services/products_service.dart';
import 'package:shopping_cart/services/firebase/products.dart';
import 'package:shopping_cart/ui/bloc/shpping_cart/shopping_cart_bloc.dart';
import 'package:shopping_cart/ui/contants/colors.dart';
import 'package:shopping_cart/ui/pages/cart/cart_page.dart';
import 'package:shopping_cart/ui/pages/home/home_page.dart';

void main() {
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<ProductService>(
      create: (_) => FrProductService(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShoppingCartBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping cart',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          accentColor: AppColors.accent,
        ),
        home: const HomePage(),
        routes: {
          CartPage.route: (_) => const CartPage(),
        },
      ),
    );
  }
}
