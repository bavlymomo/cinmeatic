import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/widgets/movie_button.dart';
import 'package:flutter/material.dart';

class CustomeList extends StatelessWidget {
  double screenHeight;
  List<Movie> moviesList;
  CustomeList(
      {super.key, required this.screenHeight, required this.moviesList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.30,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          },
          itemCount: moviesList.length,
          itemBuilder: (context, index) {
            Movie movie = moviesList[index];
            return MovieButton(
              movie: movie,
              sizeIcon: screenHeight * 0.035,
            );
          }),
    );
  }
}
