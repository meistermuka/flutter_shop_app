import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/product_details_screen.dart';
import '/screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.purple,
                secondary: Colors.deepOrange,
              ),
          fontFamily: 'Lato'),
      home: ProductsOverviewScreen(),
      routes: {
        ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
      },
    );
  }
}
