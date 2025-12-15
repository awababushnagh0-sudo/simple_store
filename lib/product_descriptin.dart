import 'package:flutter/material.dart';
import 'package:simple_store/providers/cart.dart';
import 'package:simple_store/models/products.dart';

class ProductDescriptin extends StatelessWidget {
  const ProductDescriptin({super.key, required this.product});
  final Products product;

  IconData get icon {
    switch (product.category) {
      case Category.food:
        return Icons.food_bank;
      case Category.watch:
        return Icons.watch;
      case Category.clothing:
        return Icons.checkroom;
      case Category.sneaker:
        return Icons.check;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FULL-WIDTH IMAGE (no padding)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                product.imagePath,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          const SizedBox(height: 4),
                          Text(product.rating.toString()),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Column(
                        children: [
                          Icon(icon, size: 40),
                          const SizedBox(height: 4),
                          Text(product.category.name), // cleaner
                        ],
                      ),
                      const SizedBox(width: 12),
                      Column(
                        children: const [
                          Icon(Icons.verified, size: 40, color: Colors.green),
                          SizedBox(height: 4),
                          Text('Trusted'),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),
                  Text(product.description),

                  const SizedBox(height: 12),
                  Text(
                    'Price',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.blueGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        cart.toggleButton(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            //content: Text('${product.name} added to cart'),
                            content: cart.isPressed(product)
                                ? Text('${product.name} Added to cart')
                                : Text('${product.name} Removed to cart'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: Icon(Icons.shopping_cart),
                      label: Text('Add To Cart'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
