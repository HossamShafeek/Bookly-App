import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_detail_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.22),
            child: AspectRatio(
              aspectRatio: 2.7 / 4,
              child: CustomBookImage(
                borderRadius: 10.0,
                image: book.volumeInfo!.imageLinks?.thumbnail ??
                    'http://ecx.images-amazon.com/images/I/51vZFp-ETML.jpg',
              ),
            ),
          ),
          BookDetailsSection(book: book),
          const SizedBox(
            height: 10.0,
          ),
          const SimilarBooksListView(),
        ],
      ),
    );
  }
}


