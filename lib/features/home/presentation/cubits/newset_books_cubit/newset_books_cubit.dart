import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repository/home_repository.dart';
import 'package:bookly_app/features/home/presentation/cubits/newset_books_cubit/newset_books_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepository) : super(NewsetBooksInitialState());

  final HomeRepository homeRepository;

  static NewsetBooksCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoadingState());
    Either<Failure, List<BookModel>> result;
    result = await homeRepository.fetchNewestBooks();
    result.fold(
      (failure) {
        emit(NewsetBooksFailureState(failure.error));
      },
      (books) {
        emit(NewsetBooksSuccessState(books));
      },
    );
  }
}
