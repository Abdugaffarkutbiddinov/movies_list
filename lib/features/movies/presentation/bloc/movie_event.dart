part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent extends Equatable{
  const MovieEvent();
}

class GetPopularMovies implements MovieEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();

}
