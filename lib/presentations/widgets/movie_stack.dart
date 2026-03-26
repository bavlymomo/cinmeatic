import 'package:cinmeatic/core/constants.dart';
import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieStack extends StatelessWidget {
  final Movie movie;
  const MovieStack({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          movie.image,
          fit: BoxFit.cover,
          width: AppConstants(context).width,
          height: AppConstants(context).height * 0.5,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: AppConstants(context).width,
              height: AppConstants(context).height * 0.5,
              color: Colors.grey[800],
              child: const Icon(
                Icons.movie,
                size: 64,
                color: Colors.white54,
              ),
            );
          },
        ),
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.4, 0.7, 1],
                  colors: [Colors.transparent, Colors.black26, Colors.black])),
        )),
        Positioned(
            top: 0,
            left: 8,
            child: IconButton(
                style: IconButton.styleFrom(backgroundColor: Colors.black54),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))),
        Positioned(
            top: 0,
            right: 8,
            child: IconButton(
                style: IconButton.styleFrom(backgroundColor: Colors.black54),
                onPressed: () {
                  context.read<MoviesCubit>().toggleSaveMovie(movie.id);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: const Color(0xff38364C),
                        content: Text(
                          context
                                  .read<MoviesCubit>()
                                  .state
                                  .savedMovies
                                  .contains(movie)
                              ? "Movie Saved"
                              : "Movie Removed",
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  );
                },
                icon: BlocBuilder<MoviesCubit, MoviesState>(
                  builder: (context, state) {
                    return Icon(
                      state.savedMovies.contains(movie)
                          ? Icons.bookmark
                          : Icons.bookmark_outline,
                      color: Colors.white,
                    );
                  },
                ))),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "${movie.releaseDate.length >= 4 ? movie.releaseDate.substring(0, 4) : 'N/A'} . ${movie.genres.join(' , ')} . ${movie.duration}",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ))
      ],
    );
  }
}
