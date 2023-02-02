import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repository/home_repository.dart';
import 'package:bookly_app/features/home/presentation/cubits/similar_books_cubit/similar_books_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepository) : super(SimilarBooksInitialState());

  final HomeRepository homeRepository;

  static SimilarBooksCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoadingState());
    Either<Failure, List<BookModel>> result;
    result = await homeRepository.fetchSimilarBooks(category:category);
    result.fold(
      (failure) {
        emit(SimilarBooksFailureState(failure.error));
      },
      (books) {
        emit(SimilarBooksSuccessState(books));
      },
    );
  }
}
