import 'package:flutter/foundation.dart';
import 'package:simple_store/models/products.dart';

class CartItem {
  final Products product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  void addItem(Products product) {
    final index = _items.indexWhere((item) => item.product == product);
    if (index != -1) {
      _items[index].quantity += 1;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeItem(Products product) {
    final index = _items.indexWhere((item) => item.product == product);
    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index].quantity -= 1;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void toggleButton(Products product) {
    final index = _items.indexWhere((item) => item.product == product);
    if (index == -1) {
      _items.add(CartItem(product: product));
    } else {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  bool isPressed(Products product) {
    return _items.any((item) => item.product == product);
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

final cart = Cart();
