import 'package:bookly_app/core/api/api_services_implementation.dart';
import 'package:bookly_app/core/api/end_points.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repository/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepositoryImplementation extends SearchRepository {
  final ApiServicesImplementation apiServicesImplementation;

  SearchRepositoryImplementation(this.apiServicesImplementation);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String bookName}) async {
    try {
      List<dynamic> data = await apiServicesImplementation.get(
        endPoint: EndPoints.volumes,
        queryParameters: {
          'Filtering': 'free-ebooks',
          'q': 'intitle=$bookName',
        },
      );
      List<BookModel> books =
          data.map((book) => BookModel.fromJson(book)).toList();
      return Right(books);
    } catch (error) {
      if(error is DioError){
        return Left(ServerFailure.fromDioError(error));
      }
      else{
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
