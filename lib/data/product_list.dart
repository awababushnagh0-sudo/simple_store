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

  Products(
    name: 'Iphone 17 Air ',
    price: 6900.0,
    description:
        'A sleek, lightweight smartphone with a stunning edge-to-edge display, powerful performance, advanced camera system, and long-lasting battery, designed for seamless everyday use.',
    rating: 3.2,
    category: Category.phone,
    imagePath:
        'assets/images/IMG-18066300_m_jpeg_1_782c15bc-963a-46b0-ba87-532f71cea9da.jpg.webp',
  ),
  Products(
    name: 'Iphone 17 pro ',
    price: 9000.0,
    description:
        'A premium flagship smartphone with a cutting-edge display, ultra-fast processor, pro-level camera system, and advanced features for unmatched performance and creativity.',
    rating: 4.1,
    category: Category.phone,
    imagePath: 'assets/images/Apple-iPhone-17-Pro-Deep-Blue.webp',
  ),
];
