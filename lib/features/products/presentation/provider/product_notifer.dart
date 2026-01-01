import 'package:flutter/material.dart';
import 'package:simple_store/features/products/data/product_repo.dart';
import 'package:simple_store/features/products/models/products.dart';

class ProductNotifer extends ChangeNotifier {
  List<Products> items = [];
  final ProductRepo repo;
  ProductNotifer(this.repo) {
    featchData();
  }

  //getting the data from the internet
  Future<void> featchData() async {
    try {
      final featched = await repo.featchProducts();
      items.addAll(featched);
      print(featched);
      notifyListeners();
    } catch (e) {
      throw ('Error $e');
    }
  }
}
