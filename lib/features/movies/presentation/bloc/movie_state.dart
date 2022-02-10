part of 'movie_bloc.dart';

@immutable
abstract class MovieState extends Equatable{
  MovieState();
}

class MovieInitial extends MovieState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loading extends MovieState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loaded extends MovieState {
  final List<Movie> movieList;
  Loaded({required this.movieList});
  @override
  List<Object?> get props => [movieList];
}

class Error extends MovieState {
  final String message;
  Error({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}
