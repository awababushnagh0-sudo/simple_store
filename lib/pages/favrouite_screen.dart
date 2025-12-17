import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_store/providers/favourite.dart';

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
    final fav = context.watch<FavouriteNotifier>();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Favrouites')),
      body: Stack(
        children: [
          ListView.separated(
            itemCount: fav.item.length,
            itemBuilder: (context, index) {
              final favItem = fav.item[index];
              final product = favItem.product;

              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(product.imagePath),
                ),
                title: Text(product.name),
                trailing: IconButton(
                  icon: CircleAvatar(
                    backgroundColor: theme.colorScheme.primary,
                    child: Icon(
                      Icons.remove,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  onPressed: () => setState(() {
                    fav.remove(productItem: FavouriteItem(product: product));
                  }),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey, // Customize the color
              thickness: 1, // Customize the thickness
              indent: 16, // Indentation from the start
              endIndent: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                onPressed: () => fav.clear(),
                icon: Icon(Icons.clear, color: theme.colorScheme.onPrimary),
                label: Text(
                  'Clear all Items',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
