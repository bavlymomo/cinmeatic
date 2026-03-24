import 'package:cinmeatic/core/constants.dart';
import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/widgets/movie_button.dart';

import 'package:flutter/material.dart';

class CustomeList extends StatelessWidget {
  final List<Movie> moviesList;
  const CustomeList({
    super.key,
    required this.moviesList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants(context).posterHeight,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: AppConstants.spaceMedium,
            );
          },
          itemCount: moviesList.length,
          itemBuilder: (context, index) {
            Movie movie = moviesList[index];
            return MovieButton(
              movie: movie,
            );
          }),
    );
  }
}
