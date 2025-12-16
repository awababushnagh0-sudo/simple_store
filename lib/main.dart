import 'package:flutter/material.dart';
import 'package:simple_store/app.dart';
import 'package:provider/provider.dart';
import 'package:simple_store/providers/cart.dart';
import 'package:simple_store/providers/favrouite.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Favorite()),
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: const App(),
    ),
  );
}
