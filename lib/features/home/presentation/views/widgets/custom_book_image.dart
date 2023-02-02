import 'package:bookly_app/config/icons/icons_broken.dart';
import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final double borderRadius;
  final String image;

  const CustomBookImage(
      {Key? key, required this.borderRadius, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.grey[200],
      ),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorWidget: (context, url, error) => const Icon(
          IconBroken.Info_Square,
          color: AppColors.background,
        ),
      ),
    );
  }
}
