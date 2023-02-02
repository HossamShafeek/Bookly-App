import 'package:bookly_app/core/shimmer/shimmer_container_effect.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ShimmerFeaturedListView extends StatelessWidget {
  const ShimmerFeaturedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, s) => const ShimmerContainerEffect(
        width: double.infinity,
        height: double.infinity,
        borderRadius: 10.0,
      ),
      options: CarouselOptions(
        aspectRatio: 1.5,
        viewportFraction: 0.45,
        enlargeCenterPage: true,
      ),
    );
  }
}