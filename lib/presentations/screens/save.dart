import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:cinmeatic/presentations/widgets/movie_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Save extends StatelessWidget {
  const Save({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Saved",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          BlocBuilder<MoviesCubit, MoviesState>(
            builder: (context, state) {
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    Movie movie = state.savedMovies[index];
                    return MovieSlide(movie: movie);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemCount: state.savedMovies.length,
                ),
              );
            },
          ),
          
        ],
      ),
    ));
  }
}
