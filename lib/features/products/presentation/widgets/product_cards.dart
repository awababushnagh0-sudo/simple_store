import 'package:provider/provider.dart';
import 'package:simple_store/features/products/models/products.dart';
import 'package:flutter/material.dart';
import 'package:simple_store/features/products/presentation/pages/product_descriptin.dart';
import 'package:simple_store/features/favrouite/presentation/provider/favourite.dart';

class ProductCards extends StatelessWidget {
  const ProductCards({super.key, required this.product});

  final Products product;

  void openProductSheet(BuildContext context, Products product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => ProductDescriptin(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openProductSheet(context, product);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(8),
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    product.imagePath,

                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Consumer<FavouriteNotifier>(
                      builder: (context, fav, child) {
                        return IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color:
                                fav.isFavrouite(
                                  productItem: FavouriteItem(product: product),
                                )
                                ? Colors.pink
                                : Colors.white,
                          ),
                          onPressed: () => fav.toggleIcon(
                            product: FavouriteItem(product: product),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.category.name.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 4),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                  child: Text(
                    '\$${product.price.toString()} ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 12, bottom: 12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () => openProductSheet(context, product),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
