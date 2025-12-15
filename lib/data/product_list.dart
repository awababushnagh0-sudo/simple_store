import 'package:simple_store/models/products.dart';

List<Products> products = [
  Products(
    name: 'Rolex',
    price: 3000,
    description:
        'A luxury Swiss watch with a durable stainless steel case, scratch-resistant sapphire crystal, and precision automatic movement. ',
    rating: 4.8,
    category: Category.watch,
    imagePath: 'assets/images/Rolex-Submariner-126619LB-0003.jpg',
  ),

  Products(
    name: 'Nike Air ',
    price: 560.0,
    description:
        'Lightweight running shoes with soft cushioning and breathable material for everyday comfort.',
    rating: 3.9,
    category: Category.sneaker,
    imagePath:
        'assets/images/63fe300181ceb725675c4785-nike-air-max-97-man-42-44-45-black-red.jpg',
  ),
];
