import 'dart:convert';

import 'package:movies/core/error/exceptions.dart';
import 'package:movies/features/movies/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovieList();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  static const _baseUrl = 'https://api.themoviedb.org';
  static const _API_KEY = '47e5fa95a288be3cb77ab7d7999880ae';
  static const _GET_POPULAR_MOVIES = '/3/movie/popular?api_key=';

  Uri getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    final queryParameters = <String, String>{
      'api_key': _API_KEY
    };
    if (extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }

    return Uri.parse('$_baseUrl/$url').replace(
      queryParameters: queryParameters,
    );
  }
  @override
  Future<List<MovieModel>> getPopularMovieList() async {
    var uri = Uri.https(_baseUrl, _GET_POPULAR_MOVIES + _API_KEY);
    // var uri = getUrl(url: _GET_POPULAR_MOVIES);
    final response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List _temp = [];
      for (var i in data['results']) {
        _temp.add(i);
      }
      return MovieModel.popularMoviesFromSnapshot(_temp);
    } else {
      throw ServerException();
    }
  }
}
