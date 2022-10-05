import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final specificProduct = Provider.of<Products>(
      context,
      listen:
          false, // This will not rebuild as it is not an active listener. Getting data one time.
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(title: Text(specificProduct.title)),
    );
  }
}
