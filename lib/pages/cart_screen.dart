import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_store/providers/cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartNotifier>();
    return Scaffold(
      body: cart.items.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/empty-cart-illustration-svg-download-png-6024626.webp',
                    width: 300,
                    height: 300,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your cart is Empty',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final cartItem = cart.items[index];
                final product = cartItem.product;
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      product.imagePath,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  title: Text(product.name),
                  subtitle: Text('${cartItem.itemTotalPrice.toString()} LD'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            cart.removeItem(
                              productItem: CartItem(product: product),
                            );
                          });
                        },
                      ),
                      Text('${cartItem.quantity}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            cart.addItem(
                              productItem: CartItem(product: product),
                            );
                          });
                        },
                      ),
                    ],
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
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(22),
        child: Row(
          children: [
            cart.items.isEmpty
                ? SizedBox.shrink()
                : Text(
                    'Total: ${cart.totalPrice.toStringAsFixed(2)}LD',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            Spacer(),
            cart.items.isEmpty
                ? SizedBox.shrink()
                : ElevatedButton.icon(
                    onPressed: () => cart.clear(),
                    icon: Icon(Icons.clear),
                    label: Text(
                      'Clear cart',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
