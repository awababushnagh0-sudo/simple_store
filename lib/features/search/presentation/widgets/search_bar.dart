import 'package:flutter/material.dart';
import 'package:simple_store/features/search/presentation/delegates/product_search_delegate.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 30,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),

      child: TextField(
        style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16, // left + right space
            vertical: 6, // top + bottom space
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
          hintText: 'Search for an item',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          border: InputBorder.none,
        ),
        onTap: () {
          showSearch(
            context: context,
            delegate: ProductSearchDelegate(parentContext: context),
          );
        },
      ),
    );
  }
}
