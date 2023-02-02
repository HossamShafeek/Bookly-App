import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repository/search_repository.dart';
import 'package:bookly_app/features/search/presentation/cubit/search_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchInitialState());

  final SearchRepository searchRepository;

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> fetchSearedBooks({required String bookName})async {
    emit(SearchLoadingState());
    Either<Failure,List<BookModel>> result;
    result = await searchRepository.fetchSearchedBooks(bookName: bookName);
    result.fold((failure) {
      emit(SearchFailureState(failure.error));
    }, (books){
      emit(SearchSuccessState(books));
    });
  }

  TextEditingController searchController = TextEditingController();


}
