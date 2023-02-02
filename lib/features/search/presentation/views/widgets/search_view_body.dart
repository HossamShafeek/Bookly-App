import 'package:bookly_app/config/routes/app_routes.dart';
import 'package:bookly_app/core/shimmer/shimmer_newset_list_view.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchSuccessState) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          itemCount: state.books.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.detailsView,
                  arguments: state.books[index]);
            },
            child: BookListViewItem(
              book: state.books[index],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 15.0),
        );
      } else if (state is SearchFailureState) {
        return CustomErrorWidget(error: state.error);
      } else if(state is SearchLoadingState){
        return const ShimmerNewsetListView();
      }else{
        return Container();
      }
    });
  }
}
