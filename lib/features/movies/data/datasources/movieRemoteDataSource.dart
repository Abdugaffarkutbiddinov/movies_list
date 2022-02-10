import 'package:movies/features/movies/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
Future<List<MovieModel>> getPopularMovieList();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getPopularMovieList() {
    // TODO: implement getPopularMovieList
    throw UnimplementedError();
  }

}