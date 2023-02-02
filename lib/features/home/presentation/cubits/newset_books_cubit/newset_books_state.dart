import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsetBooksState extends Equatable {
  const NewsetBooksState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewsetBooksInitialState extends NewsetBooksState {}

class NewsetBooksLoadingState extends NewsetBooksState {}

class NewsetBooksFailureState extends NewsetBooksState {
  final String error;

  const NewsetBooksFailureState(this.error);
}

class NewsetBooksSuccessState extends NewsetBooksState {
  final List<BookModel> books;

  const NewsetBooksSuccessState(this.books);
}
