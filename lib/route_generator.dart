import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/sign_in/presentation/pages/sign_page.dart';

import 'features/movies/domain/entities/movie.dart';
import 'features/movies/presentation/bloc/movie_bloc.dart';
import 'features/movies/presentation/pages/movie_details_page.dart';
import 'features/movies/presentation/pages/movie_list_page.dart';
import 'injection_container.dart';

class RouteGenerator {
  static const String moviesList = 'moviesList';
  static const String moviesDetails = 'moviesDetails';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case moviesList:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: sl<MovieBloc>(),
            child: MovieListPage(),
          ),
        );
      case moviesDetails:
        if(args is Movie) {
          return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration:
            const Duration(milliseconds: 1000),
            pageBuilder: (context, animation, secondaryAnimation) =>
                FadeTransition(
                  opacity: animation,
                  child: MovieDetailsPage(
                    movie: args,
                  ),
                ),
          );
        }
        return _errorRoute();
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
