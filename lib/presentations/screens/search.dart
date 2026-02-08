import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                hint: Text(
                  "Search by title, gener, actor",
                  style: TextStyle(color: Colors.grey),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
            onChanged: (value) {
              context.read<MoviesCubit>().searchMovie(value);
            },
            style: const TextStyle(color: Colors.white),
          ),
          BlocBuilder<MoviesCubit, MoviesState>(
            builder: (context, state) {
              // print(state.searchedMovies.length)
              return Expanded(
                child: ListView.separated(
                  itemCount: state.searchedMovies.length,
                  itemBuilder: (context, index) {
                    Movie movie = state.searchedMovies[index];
                    return Text(
                      movie.title,
                      style: Theme.of(context).textTheme.labelSmall,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}
