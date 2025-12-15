import 'package:flutter/material.dart';
import 'package:simple_store/slide_banner.dart';
import 'package:simple_store/data/product_list.dart';
import 'package:simple_store/product_cards.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SlideBanner(),
          const SizedBox(height: 16),
          SizedBox(
            height: 280,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCards(product: products[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 4),
            ),
          ),
        ],
      ),
    );
  }
}
