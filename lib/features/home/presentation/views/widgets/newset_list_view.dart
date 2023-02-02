import 'package:bookly_app/core/shimmer/shimmer_newset_list_view.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/cubits/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/cubits/newset_books_cubit/newset_books_state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetListView extends StatelessWidget {
  const NewsetListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccessState) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.books.length,
            itemBuilder: (context, index) => BookListViewItem(book: state.books[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 15.0),
          );
        } else if (state is NewsetBooksFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerNewsetListView();
        }
      },
    );
  }
}
