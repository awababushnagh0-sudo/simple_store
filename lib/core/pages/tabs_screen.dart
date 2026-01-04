import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_store/features/cart/presentation/pages/cart_screen.dart';
import 'package:simple_store/features/favrouite/presentation/pages/favrouite_screen.dart';
import 'package:simple_store/features/products/presentation/pages/main_screen.dart';
import 'package:simple_store/features/cart/presentation/provider/cart.dart';
import 'package:simple_store/features/favrouite/presentation/provider/favourite.dart';
import 'package:simple_store/features/search/presentation/widgets/search_bar.dart';
import 'package:simple_store/settings_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _pageIndex = 0;
  var _pageTitel = 'Shop';

  void _switchScreen(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  Widget _activeScreen = MainScreen();
  @override
  Widget build(BuildContext context) {
    switch (_pageIndex) {
      case 0:
        _activeScreen = MainScreen();
        _pageTitel = 'Shop';
        break;
      case 1:
        _activeScreen = CartScreen();
        _pageTitel = 'Cart';
        break;
      case 2:
        _activeScreen = FavoriteScreen();
        _pageTitel = 'Favrouites';
        break;
      case 3:
        _activeScreen = SettingsScreen();
        _pageTitel = 'settings';

      // default:
      //   _activeScreen = MainScreen();
      //   _pageTitel = 'Shop';
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        titleSpacing: 16,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _pageTitel,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(height: 40, child: SearchTab()),
          ],
        ),
        // title:
        // Text(
        //   _pageTitel,
        //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 28,
        //   ),
        // ),
      ),

      body: _activeScreen,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        onDestinationSelected: _switchScreen,
        selectedIndex: _pageIndex,

        destinations: [
          NavigationDestination(icon: Icon(Icons.shop), label: 'Shop'),
          NavigationDestination(
            label: 'Cart',
            icon: Consumer<CartNotifier>(
              builder: (context, cart, child) {
                return Stack(
                  children: [
                    Icon(Icons.shopping_cart),
                    if (cart.items.isNotEmpty)
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Theme.of(context).colorScheme.error,
                          child: Text(
                            cart.itemsCount.toString(),
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),

          NavigationDestination(
            label: 'Favrouite',
            icon: Consumer<FavouriteNotifier>(
              builder: (context, fav, child) {
                return Stack(
                  children: [
                    Icon(Icons.favorite),
                    if (fav.item.isNotEmpty)
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Theme.of(context).colorScheme.error,
                          child: Text(
                            fav.totalCount.toString(),
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          NavigationDestination(icon: Icon(Icons.settings), label: 'settings'),
        ],
      ),
    );
  }
}
