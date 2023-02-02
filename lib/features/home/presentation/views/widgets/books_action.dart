import 'package:bookly_app/core/functions/url_launcher.dart';
import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_strings.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/pdf.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.pdf}) : super(key: key);

  final Pdf pdf;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomButton(
          backgroundColor: AppColors.white,
          text: AppStings.free,
          textColor: AppColors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
          ),
        ),
        CustomButton(
          onPressed: () {
            if (pdf.isAvailable!) {
              customUrlLauncher(
                  pdf.acsTokenLink?.replaceFirst('http', 'https')??'https://google.com');
            }
          },
          backgroundColor: AppColors.brown,
          text: pdf.isAvailable! ? AppStings.download : AppStings.notAvailable,
          textColor: AppColors.white,
          fontSize: 16,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
      ],
    );
  }
}
