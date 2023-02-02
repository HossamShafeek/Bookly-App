import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repository/home_repository.dart';
import 'package:bookly_app/features/home/presentation/cubits/featured_books_cubit/featured_books_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepository) : super(FeaturedBooksInitialState());

  final HomeRepository homeRepository;

  static FeaturedBooksCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
    Either<Failure, List<BookModel>> result;
    result = await homeRepository.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(FeaturedBooksFailureState(failure.error));
      },
      (books) {
        emit(FeaturedBooksSuccessState(books));
      },
    );
  }
}
