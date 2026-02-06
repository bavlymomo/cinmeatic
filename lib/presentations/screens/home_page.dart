import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/data/data_source/movie_list_api.dart';
import 'package:cinmeatic/presentations/Widgets/homeWidgets/customList.dart';
import 'package:cinmeatic/presentations/Widgets/homeWidgets/infoRow.dart';
import 'package:cinmeatic/presentations/Widgets/homeWidgets/movieCard.dart';
import 'package:cinmeatic/presentations/Widgets/homeWidgets/myCarouselSlider.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = List.generate(6, (e) => "images/${e + 1}.jpeg");
  late Future<List<Movie>> myMoviesList;

  @override
  void initState() {
    super.initState();
    myMoviesList = MovielistApi.loadJson();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardHeight = screenHeight * 0.35;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Mycarouselslider(images: images),
            FutureBuilder(
              future: myMoviesList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text(
                    snapshot.error.toString(),
                    style: const TextStyle(color: Colors.white),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text(
                    "There Is No Data",
                    style: TextStyle(color: Colors.white),
                  );
                } else {
                  List<Movie> listMovies = snapshot.data!;
                  List<Movie> lessMovies = listMovies.take(5).toList();
                  List<Movie> latestMovie = listMovies.sublist(5, 10).toList();
                  List<Movie> mostPopular = listMovies.sublist(10, 15).toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.05,
                            bottom: screenHeight * 0.02),
                        child: Text("Last watched",
                            style: Theme.of(context).textTheme.headlineMedium),
                      ),
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
                          screenHeight: screenHeight, MoviesList: latestMovie),
                      InfoRow(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        title: 'Most Popular',
                      ),
                      CustomeList(
                          screenHeight: screenHeight, MoviesList: mostPopular),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
