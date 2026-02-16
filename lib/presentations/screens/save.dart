import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:cinmeatic/presentations/widgets/movie_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Save extends StatelessWidget {
  const Save({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Saved",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<MoviesCubit, MoviesState>(
              builder: (context, state) {
                return state.savedMovies.isEmpty
                    ? Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'images/undraw_no-data_ig65.svg',
                                // fit: BoxFit.contain,
                                width: screenHeight * 0.35,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Not Save",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                "Lets find and save your favourite videos",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Expanded(
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
        ));
  }
}
