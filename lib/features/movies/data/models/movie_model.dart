import 'dart:convert';

import 'package:movies/features/movies/domain/entities/movie.dart';

List<MovieModel> movieListModelFromJson(String str) =>
    List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieListToJson(List<MovieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel extends Movie {
  MovieModel(
      {required int id,
      required String title,
      required String posterPath,
      required String releaseDate,
      required num voteAverage,
      required String overview})
      : super(
            id: id,
            title: title,
            posterPath: posterPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            overview: overview);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'] as int,
        title: json['title'] as String,
        posterPath: json['poster_path'] as String,
        releaseDate: json['release_date'] as String,
        voteAverage: json['vote_average'] as num,
        overview: json['overview'] as String);
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "poster_path": posterPath,
    "release_date": releaseDate,
    "vote_average": voteAverage,
    "overview": overview,
  };
  static List<MovieModel> popularMoviesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return MovieModel.fromJson(data);
    }).toList();
  }
}
