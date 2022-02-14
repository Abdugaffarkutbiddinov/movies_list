import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/features/movies/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovieList();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  // final http.Client client;
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  static const _baseUrl = 'https://api.themoviedb.org';
  static const _API_KEY = '47e5fa95a288be3cb77ab7d7999880ae';
  static const _IMAGE_URL = 'https://image.tmdb.org/t/p/original';
  static const _GET_POPULAR_MOVIES = '/3/movie/popular?';

  _addImageHost(String image) => _IMAGE_URL + image;

  @override
  Future<List<MovieModel>> getPopularMovieList() async {
    String _url = '$_baseUrl$_GET_POPULAR_MOVIES';
    Map<String, dynamic> _query = {
      'api_key': _API_KEY,
      'language': 'en-US'
    };
    final response = await dio.get(_url,queryParameters: _query);
    if (response.statusCode == 200) {
      Map data = response.data;
      List<MovieModel> _results = [];
      for (var i in data['results']) {
        i['poster_path'] = _addImageHost(i['poster_path']);
        _results.add(MovieModel.fromJson(i));
      }
      return _results;
    } else {
      throw ServerException();
    }
  }
}
