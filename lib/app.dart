import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_store/pages/cart_screen.dart';
import 'package:simple_store/pages/favrouite_screen.dart';
import 'package:simple_store/pages/main_screen.dart';
import 'package:simple_store/pages/product_search_delegate.dart';
import 'package:simple_store/providers/cart.dart';
import 'package:simple_store/providers/favourite.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final Color colorSeed = const Color.fromARGB(255, 0, 140, 255);
  final Color colorSeedDark = const Color.fromARGB(255, 14, 62, 100);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorSeed,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(fontSize: 18),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorSeedDark,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(fontSize: 18),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      themeMode: ThemeMode.light,

      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Container(
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for an item',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: ProductSearchDelegate(parentContext: context),
                    );
                  },
                ),
              ),

              backgroundColor: Theme.of(context).colorScheme.surface,
              actions: [
                Consumer<CartNotifier>(
                  builder: (context, cart, child) {
                    return IconButton(
                      icon: Stack(
                        children: [
                          child!,
                          if (cart.itemsCount > 0)
                            Positioned(
                              right: 0,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.error,
                                child: Text(
                                  cart.itemsCount.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => CartScreen()),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.shopping_cart),
                ),

                Consumer<FavouriteNotifier>(
                  builder: (context, fav, child) {
                    return IconButton(
                      icon: Stack(
                        children: [
                          //Icon(Icons.favorite),
                          child!,
                          if (fav.totalCount > 0)
                            Positioned(
                              right: 0,

                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.error,
                                child: Text(
                                  fav.totalCount.toString(),
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavrouiteScreen(),
                        ),
                      ),
                    );
                  },
                  child: Icon(Icons.favorite),
                ),
              ],
            ),

            body: MainScreen(),
          );
        },
      ),
    );
  }
}
