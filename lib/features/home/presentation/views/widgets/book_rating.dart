import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;

  const BookRating(
      {Key? key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating,
      required this.count})
      : super(key: key);

  final num rating;
  final num count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: AppColors.yellow,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
         Text(
          rating.toString(),
          style: AppStyles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '($count)',
          style: AppStyles.textStyle14.copyWith(
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
