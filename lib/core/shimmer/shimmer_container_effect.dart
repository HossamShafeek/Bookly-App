import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainerEffect extends StatelessWidget {
  const ShimmerContainerEffect({Key? key,  this.width,  this.height, this.borderRadius}) : super(key: key);

  final double? width;
  final double? height;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:  Colors.white.withOpacity(0.7),
      highlightColor: Colors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius??8.0),
        ),
      ),
    );
  }
}
