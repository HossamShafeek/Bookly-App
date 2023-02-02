import 'package:bookly_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class SlidingLogo extends StatelessWidget {
  final Animation<Offset> slidingAnimation;

  const SlidingLogo({Key? key, required this.slidingAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Image.asset(
            AppAssets.logo,
            width: 260,
          ),
        );
      },
    );
  }
}
