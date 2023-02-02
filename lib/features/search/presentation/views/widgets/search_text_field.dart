import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: SearchCubit.get(context).searchController,
      maxLines: 1,
      cursorColor: AppColors.white,
      textInputAction: TextInputAction.search,
      onEditingComplete: () {
        if(SearchCubit.get(context).searchController.text.isNotEmpty){
          SearchCubit.get(context).fetchSearedBooks(
            bookName: SearchCubit.get(context).searchController.text,
          );
        }
      },
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Search',
      ),
    );
  }
}
