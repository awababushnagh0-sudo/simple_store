import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_store/models/products.dart';

class FavoriteItem with EquatableMixin {
  const FavoriteItem({required this.products});

  final Products products;

  @override
  List<Object?> get props => [products];
}

//TODO(Kshinba): rename this class
class Favorite extends ChangeNotifier {
  final List<FavoriteItem> _list = [];

  List<FavoriteItem> get item => _list;

  int get totalCount => _list.length;

  void toggleIcon({required FavoriteItem product}) {
    final isFavorite = _list.contains(product);
    !isFavorite ? _list.add(product) : _list.remove(product);
    notifyListeners();
  }

  //TODO(please): refactor same as first one
  void remove(Products product) {
    final index = _list.indexWhere((item) => item.products == product);
    _list.removeAt(index);
    notifyListeners();
  }

  //TODO(please): refactor same as first one
  bool isFavorite(Products product) {
    return _list.any((item) => item.products == product);
  }

  @override
  void dispose() {
    _list.clear();
    super.dispose();
  }
}
