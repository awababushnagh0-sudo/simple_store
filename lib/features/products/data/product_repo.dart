import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:simple_store/core/locator.dart';
import 'package:simple_store/core/services/app_services.dart';
import 'package:simple_store/features/products/models/products.dart';

class ProductRepo {
  final getitUrl = getit<AppServices>().url;

  Uri get uri => Uri.https(
    getitUrl, // domain
    '/store/products', // endpoint path
  );

  Future<List<Products>> featchProducts() async {
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        List items = jsonDecode(response.body);
        print(items);
        return items.map((e) => Products.fromJson(e)).toList();
      } else {
        throw ("Error : ${response.statusCode}");
      }
    } on SocketException {
      throw ("No internet");
    }
  }
}
