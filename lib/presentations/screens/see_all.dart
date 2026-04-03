import 'package:cinmeatic/core/constants.dart';
import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:cinmeatic/presentations/widgets/movie_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "All Movies",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: GridView.builder(
            padding: const EdgeInsets.all(AppConstants.spaceSmall),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: AppConstants(context).posterAspectRatio,
              mainAxisSpacing: AppConstants.spaceSmall,
              crossAxisSpacing: AppConstants.spaceSmall,
            ),
            itemCount: context.read<MoviesCubit>().state.allmovies.length,
            itemBuilder: (context, index) {
              Movie movie = context.read<MoviesCubit>().state.allmovies[index];
              return MovieButton(movie: movie);
            },
          ),
        ));
  }
}
