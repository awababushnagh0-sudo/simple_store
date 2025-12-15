import 'package:simple_store/models/products.dart';
import 'package:flutter/material.dart';
import 'package:simple_store/product_descriptin.dart';
import 'package:simple_store/providers/favrouite.dart';

class ProductCards extends StatelessWidget {
  const ProductCards({super.key, required this.product});

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
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
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: AnimatedBuilder(
                    animation: fav,
                    builder: (context, child) {
                      final isFav = fav.isFavorite(product);
                      return IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: isFav ? Colors.pink : Colors.white,
                        ),
                        onPressed: () => fav.toggleIcon(product),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(12),
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

          const SizedBox(height: 8),
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
                  child: OverLaySheet(product: product),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OverLaySheet extends StatefulWidget {
  const OverLaySheet({super.key, required this.product});

  final Products product;

  @override
  State<StatefulWidget> createState() {
    return _OverLaySheetState();
  }
}

class _OverLaySheetState extends State<OverLaySheet> {
  void _openSheet() {
    showBottomSheet(
      context: context,
      builder: (context) => ProductDescriptin(product: widget.product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _openSheet,
      icon: Icon(Icons.add, color: Colors.white),
    );
  }
}
