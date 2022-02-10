
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';
import 'package:movies/features/movies/presentation/bloc/movie_bloc.dart';
import 'package:movies/features/movies/presentation/widgets/loading_widget.dart';

import '../constants.dart';
import '../widgets/message_display.dart';
import 'movie_details_page.dart';


class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() =>
      _MovieListPageState();
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.appBarColor,
        title: Text(
          'Main Strategies',
          style: TextStyle(color: CustomColors.primaryTextColor),
        ),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<MovieBloc, MovieState>(
            builder: (BuildContext context, MovieState state) {
              if (state is Error) {
                return MessageDisplay(message: state.message);
              }
              if (state is Loaded) {
                List<Movie> movies = state.movieList;
                print(movies.length);
                return _list(movies);
              }
              return const LoadingWidget();
            }),
      ],
    );
  }

  Widget _list(List<Movie> movies) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Expanded(
      child: ListView.builder(
          itemCount: movies == null ? 0 : movies.length,
          itemBuilder: (context, index) {
            // BettingStrategyCard data = albums[index];
            return GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => DetailsPage(strategy: albums[index]))
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    reverseTransitionDuration:
                    const Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        FadeTransition(
                          opacity: animation,
                          child: MovieDetailsPage(
                            movie: movies[index],
                          ),
                        ),
                  ),
                );
              },
              child: Card(
                color: CustomColors.boxColor,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image(
                        image: NetworkImage(movies[index].posterPath),
                      ),
                    ),
                    Padding(
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
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: width,
                            child: Text("tap to view"
                              ,style: TextStyle(color: CustomColors.primaryTextColor),),
                          )
                        ],
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
