import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_store/providers/favrouite.dart';

class FavrouiteScreen extends StatefulWidget {
  const FavrouiteScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FavrouiteScreenState();
  }
}

class _FavrouiteScreenState extends State<FavrouiteScreen> {
  @override
  Widget build(BuildContext context) {
    final fav = context.watch<Favrouite>();
    return Scaffold(
      appBar: AppBar(title: Text('Your Favrouites')),
      body: ListView.builder(
        itemCount: fav.item.length,
        itemBuilder: (context, index) {
          final favItem = fav.item[index];
          final product = favItem.products;

          return ListTile(
            leading: Image.asset(product.imagePath),
            title: Text(product.name),
            trailing: IconButton(
              icon: Icon(Icons.remove),
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
