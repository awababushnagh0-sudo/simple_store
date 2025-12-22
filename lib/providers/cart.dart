import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_store/models/products.dart';

// ignore: must_be_immutable
class CartItem extends Equatable {
  CartItem({required this.product, this.quantity = 1});
  final Products product;
  int quantity;
  double get itemTotalPrice => product.price * quantity;

  @override
  List<Object?> get props => [product];
}

class CartNotifier extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemsCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  void addItem({required CartItem productItem}) {
    for (CartItem item in List.of(_items)) {
      if (item.product == productItem.product) {
        item.quantity++;
        break;
      }
    }
    notifyListeners();
  }

  void removeItem({required CartItem productItem}) {
    for (CartItem item in List.of(_items)) {
      if (item.product == productItem.product) {
        item.quantity > 1 ? item.quantity-- : _items.remove(item);
      }
    }

    notifyListeners();
  }

  void toggleButton({required CartItem product}) {
    final isPressed = _items.contains(product);
    !isPressed ? items.add(product) : _items.remove(product);
    notifyListeners();
  }

  bool isPressed({required CartItem product}) {
    final isPressed = _items.contains(product);
    return isPressed;
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
