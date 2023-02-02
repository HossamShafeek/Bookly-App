import 'package:bookly_app/core/utils/app_strings.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newset_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            FeaturedBooksListView(),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                AppStings.newsetBooks,
                style: AppStyles.textStyle18,
              ),
            ),
            NewsetListView(),
          ],
        ),
      ),
    );
  }
}
