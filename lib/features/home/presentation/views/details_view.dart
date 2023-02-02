import 'package:bookly_app/config/icons/icons_broken.dart';
import 'package:bookly_app/config/routes/app_routes.dart';
import 'package:bookly_app/core/widgets/custom_back_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  final BookModel book;

  const DetailsView({Key? key, required this.book}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    SimilarBooksCubit.get(context)
        .fetchSimilarBooks(category: widget.book.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        actions: [
          IconButton(
            icon: Icon(
              widget.book.volumeInfo!.previewLink!.isNotEmpty
                  ? IconBroken.Show
                  : IconBroken.Hide,
              size: 28,
            ),
            onPressed: () {
              if (widget.book.volumeInfo!.previewLink!.isNotEmpty) {
                Navigator.pushNamed(
                  context,
                  Routes.webView,
                  arguments: widget.book.volumeInfo!.previewLink!
                      .replaceFirst('http', 'https'),
                );
              }
            },
          ),
        ],
      ),
      body: DetailsViewBody(book: widget.book),
    );
  }
}
