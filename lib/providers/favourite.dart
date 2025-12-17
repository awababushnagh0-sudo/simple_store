import 'package:flutter/material.dart';
import 'package:simple_store/models/products.dart';
import 'package:equatable/equatable.dart';

class FavouriteItem extends Equatable {
  const FavouriteItem({required this.product});

  final Products product;

  @override
  List<Object?> get props => [product];
}

class FavouriteNotifier extends ChangeNotifier {
  final List<FavouriteItem> _list = [];

  List<FavouriteItem> get item => _list;

  int get totalCount => _list.length;

  void toggleIcon2(Products product) {
    final isFavrouite = _list.contains(FavouriteItem(product: product));
    if (!isFavrouite) {
      _list.add(FavouriteItem(product: product));
    } else {
      _list.removeWhere((item) => item.product == product);
    }
    notifyListeners();
  }

  void toggleIcon({required FavouriteItem product}) {
    final isFavorite = _list.contains(product);
    !isFavorite ? _list.add(product) : _list.remove(product);
    notifyListeners();
  }

  void remove({required FavouriteItem productItem}) {
    _list.removeWhere((item) => item.product == productItem.product);
    notifyListeners();
  }

  bool isFavrouite({required FavouriteItem productItem}) {
    return _list.any((item) => item.product == productItem.product);
  }

  void clear() {
    _list.clear();
    notifyListeners();
  }
}
