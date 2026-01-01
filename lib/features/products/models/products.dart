import 'package:flutter/material.dart';

enum Category { clothing, food, sneaker, watch, phone }

const iconList = {
  Category.food: Icons.food_bank,
  Category.watch: Icons.watch,
  Category.clothing: Icons.checkroom,
  Category.sneaker: Icons.check,
  Category.phone: Icons.phone,
};

class Products {
  Products({
    this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.rating,
    required this.category,
    required this.imagePath,
  });

  final String? id;
  final String name;
  final double price;
  final String description;
  final double rating;
  final Category category;
  final String imagePath;

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      name: json['name'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      category: Category.values.firstWhere(
        (e) => e.name == (json['category'] ?? 'food'),
        orElse: () => Category.food,
      ),
      imagePath: json['imagePath'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'category': category.name,
      'imagePath': imagePath,
    };
  }
}
