import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_store/pages/cart_screen.dart';
import 'package:simple_store/pages/favrouite_screen.dart';
import 'package:simple_store/pages/main_screen.dart';
import 'package:simple_store/pages/product_search_delegate.dart';
import 'package:simple_store/providers/cart.dart';
import 'package:simple_store/providers/favrouite.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final Color colorSeed = Colors.blue;
  final Color colorSeedDark = const Color.fromARGB(255, 14, 62, 100);

  @override
  Widget build(BuildContext context) {
    //final fav = context.watch<Favrouite>();
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
            bodyMedium: TextStyle(fontSize: 16),
            bodySmall: TextStyle(fontSize: 12),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 5,
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
              title: Text('Welcom to my store', textAlign: TextAlign.left),
              backgroundColor: Theme.of(context).colorScheme.primary,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: ProductSearchDelegate(parentContext: context),
                    );
                  },
                ),
                Consumer<Cart>(
                  builder: (context, cart, child) {
                    return IconButton(
                      icon: Stack(
                        children: [
                          child!,
                          if (cart.itemCount > 0)
                            Positioned(
                              right: 0,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.red,
                                child: Text(
                                  cart.itemCount.toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
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

                Consumer<Favrouite>(
                  builder: (context, fav, child) {
                    return IconButton(
                      icon: Stack(
                        children: [
                          //Icon(Icons.favorite),
                          child!,
                          if (fav.totalCount > 0)
                            Positioned(
                              top: 0,

                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.red,
                                child: Text(
                                  fav.totalCount.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
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
