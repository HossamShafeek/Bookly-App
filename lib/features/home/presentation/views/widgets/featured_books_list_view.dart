import 'package:bookly_app/config/routes/app_routes.dart';
import 'package:bookly_app/core/shimmer/shimmer_featured_list_view.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/cubits/featured_books_cubit/featured_books_state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          return CarouselSlider.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index, s) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.detailsView,
                  arguments: state.books[index],
                );
              },
              child: CustomBookImage(
                image: state.books[index].volumeInfo!.imageLinks?.thumbnail ??
                    'http://ecx.images-amazon.com/images/I/51vZFp-ETML.jpg',
                borderRadius: 10.0,
              ),
            ),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.5,
              viewportFraction: 0.45,
              enlargeCenterPage: true,
            ),
          );
        } else if (state is FeaturedBooksFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerFeaturedListView();
        }
      },
    );
  }
}

