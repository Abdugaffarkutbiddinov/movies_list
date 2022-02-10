import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failures.dart';

import '../entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getPopularMoviesList();
}
