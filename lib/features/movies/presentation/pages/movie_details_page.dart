
import 'package:flutter/material.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';
import 'package:provider/src/provider.dart';

import '../constants.dart';
import '../widgets/details_back_button.dart';


class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  String _cartTag = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: AddButtonDetails(
              onPressed: () {
                setState(() {
                  _cartTag = '_carTag';
                });
                Navigator.pop(context);
              },
              text: 'Add to Favourites',
              backgroundColor: CustomColors.primaryTextColor,
              textColor: CustomColors.backgroundColor,
            ),
          ),
        ),
      ),
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.37,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    color: Color(0xFFF8F8F8),
                    child: Hero(
                      tag: widget.movie.title + _cartTag,
                      child: Image(
                        image: NetworkImage(widget.movie.posterPath),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultPadding * 1.5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.movie.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold)
                          .copyWith(color: CustomColors.primaryTextColor),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Container(
                child: Text(
                  widget.movie.overview,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    height: 1.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(
        color: CustomColors.primaryTextColor,
      ),
      backgroundColor: CustomColors.appBarColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Movies",
        style: TextStyle(color: CustomColors.primaryTextColor),
      ),
    );
  }
}
