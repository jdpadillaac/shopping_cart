import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/ui/bloc/home/home_bloc.dart';
import 'package:shopping_cart/ui/contants/colors.dart';
import 'package:shopping_cart/ui/contants/spacing.dart';

part 'widgets/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ProductItem(),
            _ProductItem(),
            _ProductItem(),
            _ProductItem(),
            _ProductItem(),
            _ProductItem(),


          ],
        ),
      ),
    );
  }
}

class _HomeCart extends StatelessWidget {
  const _HomeCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
      ),
      child: InkWell(
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
