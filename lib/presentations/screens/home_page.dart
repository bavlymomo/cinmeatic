import 'package:cinmeatic/core/constants.dart';
import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:cinmeatic/presentations/widgets/custom_list.dart';
import 'package:cinmeatic/presentations/widgets/info_row.dart';
import 'package:cinmeatic/presentations/widgets/movie_card.dart';
import 'package:cinmeatic/presentations/widgets/my_carousel_slider.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                    const InfoRow(title: "Last watched"),
                    SizedBox(
                      height: AppConstants(context).movieCardHeight,
                      child: ListView.separated(
                        itemCount: lessMovies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Movie movie = lessMovies[index];
                          return MovieCard(
                            movie: movie,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: AppConstants.spaceMedium,
                          );
                        },
                      ),
                    ),
                    const InfoRow(
                      title: 'Latest Movies',
                    ),
                    CustomeList(
                      moviesList: latestMovie,
                    ),
                    const InfoRow(
                      title: 'Most Popular',
                    ),
                    CustomeList(
                      moviesList: mostPopular,
                    ),
                  ],
                );
              }
            },
          )
        ],
      ),
    ));
  }
}
