import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:cinmeatic/presentations/widgets/home_widgets/custom_list.dart';
import 'package:cinmeatic/presentations/widgets/home_widgets/info_row.dart';
import 'package:cinmeatic/presentations/widgets/home_widgets/movie_card.dart';

import 'package:cinmeatic/presentations/widgets/home_widgets/my_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = List.generate(6, (e) => "images/${e + 1}.jpeg");
  late List<Movie> myMoviesList;

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<MoviesCubit>().fetchMovies();
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardHeight = screenHeight * 0.35;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Mycarouselslider(images: images),
            BlocBuilder<MoviesCubit, MoviesState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const CircularProgressIndicator();
                }
                if (state.errorMsg != null) {
                  return Text(
                    state.errorMsg!,
                    style: Theme.of(context).textTheme.labelSmall,
                  );
                }
                if (state.allmovies.isEmpty) {
                  return Text("Data not found ",
                      style: Theme.of(context).textTheme.labelSmall);
                } else {
                  List<Movie> lessMovies = state.allmovies.take(5).toList();
                  List<Movie> mostPopular =
                      state.allmovies.sublist(6, 10).toList();
                  List<Movie> latestMovie =
                      state.allmovies.sublist(10, 15).toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoRow(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          title: "Last watched"),
                      SizedBox(
                        height: cardHeight,
                        child: ListView.separated(
                          itemCount: lessMovies.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Movie movie = lessMovies[index];
                            return MovieCard(
                              movie: movie,
                              cardHeight: cardHeight,
                              screenWidth: screenWidth,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 20,
                            );
                          },
                        ),
                      ),
                      InfoRow(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        title: 'Latest Movies',
                      ),
                      CustomeList(
                        screenHeight: screenHeight,
                        moviesList: latestMovie,
                      ),
                      InfoRow(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        title: 'Most Popular',
                      ),
                      CustomeList(
                        screenHeight: screenHeight,
                        moviesList: mostPopular,
                      ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}
