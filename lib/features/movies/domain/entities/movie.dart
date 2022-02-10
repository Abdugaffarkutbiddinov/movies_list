import 'package:equatable/equatable.dart';

class Movie implements Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final String overview;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.overview,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,posterPath,releaseDate,voteAverage,overview];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
