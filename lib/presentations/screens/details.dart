import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:cinmeatic/presentations/widgets/movie_card.dart';
import 'package:cinmeatic/presentations/widgets/movie_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    final List<Movie> similarMovies = context
        .read<MoviesCubit>()
        .state
        .allmovies
        .where((e) => e.genres.any((e) => movie.genres.contains(e)))
        .toList();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            MovieStack(movie: movie),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow),
                          Text(
                            " Play",
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.download),
                          Text(" Download"),
                        ],
                      )),
                ),
              ],
            ),
            Text(
              movie.overview,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50), // Spacer instead of Expanded
            SizedBox(
              height: 400,
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(tabs: [
                      Tab(text: "Episode"),
                      Tab(text: "Similar"),
                      Tab(text: "About"),
                    ]),
                    Expanded(
                      child: TabBarView(children: [
                        const Center(child: Text("Episode content")),
                        GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 14 / 19,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8),
                            itemCount: similarMovies.length,
                            itemBuilder: (context, index) {
                              Movie movie = similarMovies[index];
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child:
                                    Image.asset(movie.image, fit: BoxFit.cover),
                              );
                            }),
                        About(movie: movie)
                      ]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class About extends StatelessWidget {
  final Movie movie;

  const About({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 16,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _speCol('Gener', movie.genres.join(', ')),
              ),
              Expanded(child: _speCol('language text', movie.language)),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: _speCol(
                    'Year', movie.releaseDate.substring(0, 4).toString()),
              ),
              Expanded(child: _speCol('Rating', movie.rating.toString())),
            ],
          )
        ],
      ),
    );
  }

  Widget _speCol(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 5),
        Text(content,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
