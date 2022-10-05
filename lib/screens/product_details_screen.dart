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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                specificProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '\$${specificProduct.price}',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                specificProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
