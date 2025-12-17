import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SlideBanner extends StatefulWidget {
  const SlideBanner({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SlideBannerState();
  }
}

class _SlideBannerState extends State<SlideBanner> {
  final images = [
    'assets/images/nike-free-psd-p1.jpg',
    'assets/images/original-48cdcea137da40965b4ad52b3cf6a012.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        viewportFraction: 1.0,
      ),
      items: images.map((imageP) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imageP,
                  height: 200,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
