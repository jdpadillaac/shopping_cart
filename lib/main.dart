import 'package:flutter/material.dart';
import 'package:shopping_cart/ui/contants/colors.dart';
import 'package:shopping_cart/ui/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping cart',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        accentColor: AppColors.accent,
      ),
      home: HomePage(),
    );
  }
}
