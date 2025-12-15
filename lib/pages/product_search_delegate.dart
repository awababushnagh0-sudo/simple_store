import 'package:flutter/material.dart';
import 'package:simple_store/data/product_list.dart';

import 'package:simple_store/models/products.dart';

import 'package:simple_store/product_descriptin.dart';

class ProductSearchDelegate extends SearchDelegate<Products?> {
  ProductSearchDelegate({required this.parentContext});
  final BuildContext parentContext;
  @override
  String? get searchFieldLabel => 'Search products';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return _buildList(context, results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return _buildList(context, suggestions);
  }

  Widget _buildList(BuildContext context, List<Products> list) {
    if (list.isEmpty) {
      return const Center(child: Text('No products found'));
    }

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final product = list[index];

        return ListTile(
          leading: Image.asset(product.imagePath, width: 50, fit: BoxFit.cover),
          title: Text(product.name),
          subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
          onTap: () {
            close(context, product);
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ProductDescriptin(product: product),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
