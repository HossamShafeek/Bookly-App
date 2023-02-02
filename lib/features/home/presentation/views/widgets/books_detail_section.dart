import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_strings.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Spacer(),
          Text(
            book.volumeInfo!.title??'Title Not Found',
            style: AppStyles.textStyle30,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            book.volumeInfo!.authors!.join(' - '),
            style: AppStyles.textStyle18.copyWith(
              color: AppColors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 15.0,
          ),
           BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
            rating: book.volumeInfo!.averageRating??0,
            count: book.volumeInfo!.ratingsCount??0,
          ),
          const Spacer(),
           BooksAction(pdf:book.accessInfo!.pdf!),
          const Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStings.youCanAlsoLike,
              style: AppStyles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
