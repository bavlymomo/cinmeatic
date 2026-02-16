import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieSlide extends StatelessWidget {
  final Movie movie;

  const MovieSlide({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    final String subtitle;
    if (movie.genres.length > 2) {
      subtitle = movie.genres.take(2).join(' , ');
    } else {
      subtitle = movie.genres.join(' , ');
    }
    return AspectRatio(
      aspectRatio: 30 / 12,
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xff1F1D35),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.asset(
                    movie.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          subtitle,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 244, 19, 3),
                          padding: const EdgeInsets.symmetric(horizontal: 48)),
                      child: const Text(
                        "Watch now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: IconButton(
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
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.blue),
                            child: const Text(
                              "Cancel",
                            ),
                          ),
                          FilledButton(
                            onPressed: () {
                              context
                                  .read<MoviesCubit>()
                                  .deleteSavedMovie(movie.id);
                              Navigator.pop(context);
                            },
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text(
                              "Delete",
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
