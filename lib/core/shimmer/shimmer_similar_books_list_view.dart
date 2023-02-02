import 'package:bookly_app/core/shimmer/shimmer_container_effect.dart';
import 'package:flutter/material.dart';

class ShimmerSimilarBooksListView extends StatelessWidget {
  const ShimmerSimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => const AspectRatio(
          aspectRatio: 2.7 / 4,
          child: ShimmerContainerEffect(),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10.0),
      ),
    );
  }
}
