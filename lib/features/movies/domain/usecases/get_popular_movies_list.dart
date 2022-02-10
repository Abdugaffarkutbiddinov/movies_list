
import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failures.dart';
import 'package:movies/core/usecase/usecase.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';
import 'package:movies/features/movies/domain/repositories/movie_repository.dart';

class GetPopularMoviesList extends UseCase<List<Movie>, NoParams>{
  final MovieRepository repository;

  GetPopularMoviesList({required this.repository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async{
    return await repository.getPopularMoviesList();
  }
}