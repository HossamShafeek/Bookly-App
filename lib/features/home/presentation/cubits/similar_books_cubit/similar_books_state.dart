import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SimilarBooksInitialState extends SimilarBooksState {}

class SimilarBooksLoadingState extends SimilarBooksState {}

class SimilarBooksFailureState extends SimilarBooksState {
  final String error;

  const SimilarBooksFailureState(this.error);
}

class SimilarBooksSuccessState extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSuccessState(this.books);
}
