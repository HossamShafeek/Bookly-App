import 'package:bookly_app/core/api/api_services_implementation.dart';
import 'package:bookly_app/core/api/end_points.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final ApiServicesImplementation apiServicesImplementation;

  const HomeRepositoryImplementation(this.apiServicesImplementation);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      List<dynamic> data = await apiServicesImplementation.get(
        endPoint: EndPoints.volumes,
        queryParameters: {
          'Filtering': 'free-ebooks',
          'Sorting': 'newest',
          'q': 'programming',
        },
      );
      List<BookModel> books =
          data.map((book) => BookModel.fromJson(book)).toList();
      return Right(books);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      List<dynamic> data = await apiServicesImplementation.get(
        endPoint: EndPoints.volumes,
        queryParameters: {
          'Filtering': 'free-ebooks',
          'q': 'computer science',
        },
      );
      List<BookModel> books =
          data.map((book) => BookModel.fromJson(book)).toList();
      return Right(books);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try {
      List<dynamic> data = await apiServicesImplementation.get(
        endPoint: EndPoints.volumes,
        queryParameters: {
          'Filtering': 'free-ebooks',
          'q': category,
        },
      );
      List<BookModel> books =
      data.map((book) => BookModel.fromJson(book)).toList();
      return Right(books);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
