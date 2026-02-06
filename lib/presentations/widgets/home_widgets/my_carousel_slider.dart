import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Mycarouselslider extends StatelessWidget {
  final List<String> images;
  const Mycarouselslider({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
            height: 350.0,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayInterval: const Duration(seconds: 3)),
        items: images.map((e) {
          return ClipRRect(
            child: Image.asset(
              e,
              fit: BoxFit.cover,
              width: 250,
            ),
          );
        }).toList());
    ;
  }
}
