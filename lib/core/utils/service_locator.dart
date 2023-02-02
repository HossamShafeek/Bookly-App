import 'package:bookly_app/core/api/api_services_implementation.dart';
import 'package:bookly_app/features/home/data/repository/home_repository_implementation.dart';
import 'package:bookly_app/features/search/data/repository/search_repository_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServicesImplementation>(
      ApiServicesImplementation());
  getIt.registerSingleton<HomeRepositoryImplementation>(
      HomeRepositoryImplementation(getIt.get<ApiServicesImplementation>()));
  getIt.registerSingleton<SearchRepositoryImplementation>(
      SearchRepositoryImplementation(getIt.get<ApiServicesImplementation>()));
}
