import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    // only dispatching changes to the cart hence listen: false
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            )),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(product.isFavourite
                  ? Icons.favorite
                  : Icons.favorite_outline),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                product.toggleFavouriteStatus();
              },
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            },
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
