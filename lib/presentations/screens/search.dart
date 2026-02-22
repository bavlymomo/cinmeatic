import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:cinmeatic/presentations/widgets/custom_list.dart';
import 'package:cinmeatic/presentations/widgets/info_row.dart';
import 'package:cinmeatic/presentations/widgets/movie_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController? _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
        body: Column(
      children: [
        TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
              hint: Text(
                "🔍  Search by title, gener, actor",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32)))),
          onChanged: (value) {
            context.read<MoviesCubit>().searchMovie(value);
          },
          style: const TextStyle(color: Colors.white),
        ),
        BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            return _textEditingController!.text.isEmpty
                ? Column(
                    children: [
                      InfoRow(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          title: "Popular "),
                      CustomeList(
                        screenHeight: screenHeight * 0.7,
                        moviesList: state.allmovies.sublist(8, 12),
                        likedMovies: state.savedMovies,
                      ),
                    ],
                  )
                : Expanded(
                    child: ListView.separated(
                      itemCount: state.searchedMovies.length,
                      itemBuilder: (context, index) {
                        Movie movie = state.searchedMovies[index];
                        return Center(
                            child: MovieButton(
                          movie: movie,
                          sizeIcon: screenHeight * 0.045,
                          likedMovies: state.savedMovies,
                        ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                  );
          },
        )
      ],
    ));
  }
}
