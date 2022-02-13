import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';

import '../constants.dart';
import '../widgets/details_back_button.dart';
import '../widgets/logout_icon.dart';

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
            padding:
                const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
            child: AddButtonDetails(
              onPressed: () {
                setState(() {
                  _cartTag = '_carTag';
                });
                Navigator.pop(context);
              },
              text: 'Назад',
              backgroundColor: CustomColors.primaryTextColor,
              textColor: CustomColors.backgroundColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoutIcon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              // AspectRatio(
              //   aspectRatio: 1.37,
              //   child: Stack(
              //     clipBehavior: Clip.none,
              //     alignment: Alignment.center,
              //     children: [
              //       Container(
              //         width: double.infinity,
              //         color: Color(0xFFF8F8F8),
              //         child: Hero(
              //           tag: widget.movie.title + _cartTag,
              //           child: Image(
              //             image: NetworkImage(widget.movie.posterPath),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              AspectRatio(aspectRatio: 3/2,child: Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Card(
                  clipBehavior: Clip.antiAlias,

                  child: Image(
                    image: NetworkImage(widget.movie.posterPath,),
                    fit: BoxFit.cover,
                  ),
                ),
              ),),

              const SizedBox(height: defaultPadding * 1.5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(widget.movie.title,
                          style: GoogleFonts.roboto(
                            fontSize: 24.0,
                            color: CustomColors.detailsPrimaryColor,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Container(
                  child: Text(
                    widget.movie.overview,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: CustomColors.detailsPrimaryColor,
                      height: 1.8,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
