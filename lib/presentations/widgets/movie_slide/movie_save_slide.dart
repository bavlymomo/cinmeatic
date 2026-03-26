import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:cinmeatic/presentations/widgets/movie_slide/movie_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieSaveSlide extends MovieSlide {
  const MovieSaveSlide({super.key, required super.movie});

  @override
  Widget buildActionwidget(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.delete,
        color: Colors.white54,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "Delete Movie",
                style: TextStyle(color: Colors.white),
              ),
              content: const Text(
                "Are you sure",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: const Color(0xff38364C),
              actions: [
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: FilledButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    "Cancel",
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    context.read<MoviesCubit>().deleteSavedMovie(movie.id);
                    Navigator.pop(context);
                  },
                  style: FilledButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Delete",
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget buildBottomPart(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: FilledButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 244, 19, 3),
        // padding: const EdgeInsets.symmetric(horizontal: 48)
      ),
      child: const Text(
        "Watch now",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
