import 'package:cinmeatic/core/constants.dart';
import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:cinmeatic/presentations/widgets/movie_slide/movie_download_slide.dart';
import 'package:cinmeatic/presentations/widgets/movie_slide/movie_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Download extends StatelessWidget {
  const Download({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Downloaded",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: AppConstants.spaceSmall,
        ),
        BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            return state.downloadedMovies.isEmpty
                ? Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'images/undraw_taken_mshk.svg',
                            // fit: BoxFit.contain,
                            width: AppConstants(context).movieCardHeight,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "No Download Yet",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: AppConstants.spaceSmall,
                          ),
                          Text(
                            "Lets find and download your favourite videos",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        Movie movie = state.downloadedMovies[index];
                        return MovieDownloadSlide(movie: movie);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: AppConstants.spaceSmall,
                        );
                      },
                      itemCount: state.downloadedMovies.length,
                    ),
                  );
          },
        ),
      ],
    ));
  }
}
