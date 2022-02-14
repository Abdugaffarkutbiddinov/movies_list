import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';
import 'package:movies/features/movies/presentation/bloc/movie_bloc.dart';
import 'package:movies/features/movies/presentation/widgets/loading_widget.dart';
import 'package:movies/route_generator.dart';

import '../constants.dart';
import '../widgets/logout_icon.dart';
import '../widgets/error_message_display.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  void initState() {
    // TODO: implement initState
    _loadPopularMovies();
  }

  _loadPopularMovies() async {
    context.read<MovieBloc>().add(GetPopularMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return SafeArea(
      child: Column(
        children: [
          LogoutIcon(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/', (Route<dynamic> route) => false);
            },
          ),
          BlocBuilder<MovieBloc, MovieState>(
              builder: (BuildContext context, MovieState state) {
            if (state is Error) {
              return ErrorMessageDisplay(message: state.message);
            }
            if (state is Loaded) {
              List<Movie> movies = state.movieList;
              print(movies.length);
              return _list(movies);
            }
            return const LoadingWidget();
          }),
        ],
      ),
    );
  }

  Widget _list(List<Movie> movies) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Expanded(
      child: ListView.builder(
          itemCount: movies == null ? 0 : movies.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RouteGenerator.moviesDetails,
                    arguments: movies[index]);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: CustomColors.boxColor,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 130,
                      child: Image(
                        image: NetworkImage(movies[index].posterPath),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movies[index].title,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: width,
                              child: Text(
                                movies[index].releaseDate,
                                style: TextStyle(
                                    color: CustomColors.primaryTextColor),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: width,
                              child: Text(
                                movies[index].voteAverage.toString(),
                                style: TextStyle(
                                    color: Colors.amber, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
