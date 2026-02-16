import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/widgets/movie_stack.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

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
            const Expanded(
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: TabBar(tabs: [
                    Tab(text: "Episode"),
                    Tab(text: "similar"),
                    Tab(text: "about"),
                  ]),
                  body: TabBarView(children: [
                    Text("Episode"),
                    Text("similar"),
                    Text("about"),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
