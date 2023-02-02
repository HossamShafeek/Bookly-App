import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable{
  const SearchState();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class SearchInitialState extends SearchState{}
class SearchLoadingState extends SearchState{}
class SearchFailureState extends SearchState{
  final String error;

  const SearchFailureState(this.error);
}
class SearchSuccessState extends SearchState{
  final List<BookModel> books;

  const SearchSuccessState(this.books);
}