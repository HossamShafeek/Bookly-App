import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final BorderRadius? borderRadius;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onPressed;
  final double? fontSize;

  const CustomButton({
    Key? key,
    this.borderRadius,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.onPressed,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 45,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: AppColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(15.0),
            ),
          ),
          child: Text(
            text,
            style: AppStyles.textStyle18.copyWith(
              color: textColor,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
