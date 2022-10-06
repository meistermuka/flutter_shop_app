import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  const UserProductItem({this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
            color: Theme.of(context).colorScheme.primary,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
            color: Theme.of(context).colorScheme.error,
          ),
        ]),
      ),
    ));
  }
}
