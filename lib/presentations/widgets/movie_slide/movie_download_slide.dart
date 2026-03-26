import 'package:cinmeatic/core/constants.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:cinmeatic/presentations/widgets/movie_slide/movie_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDownloadSlide extends MovieSlide {
  const MovieDownloadSlide({super.key, required super.movie});

  @override
  Widget buildActionwidget(BuildContext context) {
    int movieIndex =
        context.read<MoviesCubit>().state.downloadedMovies.indexOf(movie);
    return Container(
      width: AppConstants.spaceHuge,
      height: AppConstants.spaceHuge,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white24),
      child: Center(
        child: Text(
          (movieIndex + 1).toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget buildBottomPart(BuildContext context) {
    return const Text(
      "2 :30 :15 | 1.2 GB",
      style:  TextStyle(color: Colors.grey, fontSize: 14),
    );
  }
}
