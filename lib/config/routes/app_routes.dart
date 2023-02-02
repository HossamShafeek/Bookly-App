import 'package:bookly_app/core/api/api_services_implementation.dart';
import 'package:bookly_app/core/utils/app_strings.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repository/home_repository_implementation.dart';
import 'package:bookly_app/features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/cubits/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/home/presentation/views/web_view.dart';
import 'package:bookly_app/features/search/data/repository/search_repository_implementation.dart';
import 'package:bookly_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const splashView = '/';
  static const homeView = '/home_view';
  static const detailsView = '/details_view';
  static const searchView = '/search_view';
  static const webView = '/web_view';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => FeaturedBooksCubit(
                  getIt.get<HomeRepositoryImplementation>(),
                )..fetchFeaturedBooks(),
              ),
              BlocProvider(
                create: (BuildContext context) => NewsetBooksCubit(
                  getIt.get<HomeRepositoryImplementation>(),
                )..fetchNewsetBooks(),
              ),
            ],
            child: const HomeView(),
          ),
        );
      case Routes.detailsView:
        final book = settings.arguments as BookModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                SimilarBooksCubit(getIt.get<HomeRepositoryImplementation>()),
            child: DetailsView(
              book: book,
            ),
          ),
        );
      case Routes.searchView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                SearchCubit(getIt.get<SearchRepositoryImplementation>()),
            child: const SearchView(),
          ),
        );
      case Routes.webView:
        final previewLink = settings.arguments as String;
        return MaterialPageRoute(builder: (context) => WebView(previewLink: previewLink,),);
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStings.noRouteFound),
            ),
          )),
    );
  }
}
