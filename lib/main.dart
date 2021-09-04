import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/services/products_service.dart';
import 'services/firebase/services/products.dart';
import 'ui/bloc/shpping_cart/shopping_cart_bloc.dart';
import 'ui/contants/colors.dart';
import 'ui/pages/cart/cart_page.dart';
import 'ui/pages/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then(
    (_) {
      runApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider<ProductService>(
              create: (_) => FrProductService(),
            ),
          ],
          child: const MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
