import 'package:flutter/material.dart';
import 'package:simple_store/models/products.dart';

class FavrouiteItem {
  FavrouiteItem({required this.products});

  final Products products;
}

class Favrouite extends ChangeNotifier {
  final List<FavrouiteItem> _list = [];

  List<FavrouiteItem> get item => _list;

  int get totalCount => _list.length;

  void toggleIcon(Products product) {
    final index = _list.indexWhere((item) => item.products == product);

    if (index == -1) {
      _list.add(FavrouiteItem(products: product));
    } else {
      _list.removeAt(index);
    }
    notifyListeners();
  }

  void remove(Products product) {
    final index = _list.indexWhere((item) => item.products == product);
    _list.removeAt(index);
    notifyListeners();
  }

  bool isFavorite(Products product) {
    return _list.any((item) => item.products == product);
  }

  void clear() {
    _list.clear();
    notifyListeners();
  }
}

final fav = Favrouite();
