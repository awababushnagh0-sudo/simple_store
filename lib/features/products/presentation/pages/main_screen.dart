import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_store/features/products/presentation/provider/product_notifer.dart';
import 'package:simple_store/features/products/presentation/widgets/slide_banner.dart';
import 'package:simple_store/data/product_list.dart';
import 'package:simple_store/features/products/presentation/widgets/product_cards.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifer = context.watch<ProductNotifer>().items;
    print(notifer);
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16),
            SlideBanner(),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.all(8),
              childAspectRatio: 0.7,
              children: products
                  .map((product) => ProductCards(product: product))
                  .toList(),
              //   children: notifer
              //       .map((item) => ProductCards(product: item))
              //       .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
