import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/failures.dart';
import 'package:movies/core/network/network_info.dart';
import 'package:movies/features/movies/data/datasources/movieRemoteDataSource.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';
import 'package:movies/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Movie>>> getPopularMoviesList() async{
    if(await networkInfo.isConnected) {
      try {
        final remoteMovieList = await remoteDataSource.getPopularMovieList();
        return Right(remoteMovieList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
