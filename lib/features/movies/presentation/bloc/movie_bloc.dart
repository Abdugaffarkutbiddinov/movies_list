import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/usecase/usecase.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';
import 'package:movies/features/movies/domain/usecases/get_popular_movies_list.dart';

import '../../../../core/error/failures.dart';

part 'movie_event.dart';

part 'movie_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'No Internet Connection';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMoviesList getPopularMovies;

  MovieBloc({required this.getPopularMovies}) : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {
      emit(Loading());
      final failureOrPopularMoviesList = await getPopularMovies(NoParams());
      emit(_eitherLoadedOrErrorState(failureOrPopularMoviesList));
    });
  }

  MovieState _eitherLoadedOrErrorState(
      Either<Failure, List<Movie>> failureOrMovieList) {
    return failureOrMovieList.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (movieList) => Loaded(movieList: movieList));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case NoConnectionFailure:
        return CONNECTION_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
