import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double strokeWidth;
  final Color color;

  const LoadingIndicator(
      {Key? key, this.strokeWidth = 4.0, this.color = AppColors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
