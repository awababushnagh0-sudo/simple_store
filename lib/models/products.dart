import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum Category { clothing, food, sneaker, watch }

const iconList = {
  Category.food: Icons.food_bank,
  Category.watch: Icons.watch,
  Category.clothing: Icons.checkroom,
  Category.sneaker: Icons.check,
};

class Products with EquatableMixin {
  Products({
    required this.name,
    required this.price,
    required this.description,
    required this.rating,
    required this.category,
    required this.imagePath,
  });

  final String name;
  final double price;
  final String description;
  final double rating;
  final Category category;
  final String imagePath;

  @override
  // TODO: implement props
  List<Object?> get props => [
    name,

    price,

    description,

    rating,

    category,

    imagePath,
  ];
}
