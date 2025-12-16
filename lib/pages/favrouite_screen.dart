import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_store/providers/favrouite.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FavoriteScreenState();
  }
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final fav = context.watch<Favorite>();
    return Scaffold(
      appBar: AppBar(title: Text('Your Favorite')),
      body: ListView.builder(
        itemCount: fav.item.length,
        itemBuilder: (context, index) {
          final favItem = fav.item[index];
          final product = favItem.products;

          return ListTile(
            leading: Image.asset(product.imagePath),
            title: Text(product.name),
            trailing: IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => setState(() {
                fav.remove(product);
              }),
            ),
          );
        },
      ),
    );
  }
}
