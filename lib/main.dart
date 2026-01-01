import 'package:flutter/material.dart';
import 'package:simple_store/app.dart';
import 'package:provider/provider.dart';
import 'package:simple_store/core/locator.dart';
import 'package:simple_store/features/cart/presentation/provider/cart.dart';
import 'package:simple_store/features/favrouite/presentation/provider/favourite.dart';
import 'package:simple_store/features/products/data/product_repo.dart';
import 'package:simple_store/features/products/presentation/provider/product_notifer.dart';

void main() {
  setupLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouriteNotifier()),
        ChangeNotifierProvider(create: (_) => CartNotifier()),
        ChangeNotifierProvider(
          create: (_) => ProductNotifer(getit<ProductRepo>()),
        ),
      ],
      child: const App(),
    ),
  );
}
