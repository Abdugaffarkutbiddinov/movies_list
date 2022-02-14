
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movies/core/network/network_info.dart';
import 'package:movies/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:movies/features/movies/domain/repositories/movie_repository.dart';
import 'package:movies/features/movies/domain/usecases/get_popular_movies_list.dart';
import 'package:movies/features/movies/presentation/bloc/movie_bloc.dart';

final sl = GetIt.instance;

init() {
  sl.registerFactory(() => MovieBloc(getPopularMovies: sl()));

  sl.registerLazySingleton(() => GetPopularMoviesList(repository: sl()));

  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(dio: sl()));

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
}