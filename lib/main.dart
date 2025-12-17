import 'package:flutter/material.dart';
import 'package:simple_store/app.dart';
import 'package:provider/provider.dart';
import 'package:simple_store/providers/cart.dart';
import 'package:simple_store/providers/favourite.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouriteNotifier()),
        ChangeNotifierProvider(create: (_) => CartNotifier()),
      ],
      child: const App(),
    ),
  );
}
