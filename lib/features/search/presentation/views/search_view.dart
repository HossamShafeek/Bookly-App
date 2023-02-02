import 'package:bookly_app/config/icons/icons_broken.dart';
import 'package:bookly_app/core/widgets/custom_back_button.dart';
import 'package:bookly_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const SearchTextField(),
        actions: [
          IconButton(
            icon: const Icon(IconBroken.Search),
            onPressed: () {
              if(SearchCubit.get(context).searchController.text.isNotEmpty){
                SearchCubit.get(context).fetchSearedBooks(
                  bookName: SearchCubit.get(context).searchController.text,
                );
              }
            },
          ),
        ],
      ),
      body: const SearchViewBody(),
    );
  }
}
