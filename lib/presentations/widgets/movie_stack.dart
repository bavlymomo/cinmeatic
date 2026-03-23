import 'package:cinmeatic/data/Models/movie.dart';
import 'package:flutter/material.dart';

class MovieStack extends StatelessWidget {
  final Movie movie;
  const MovieStack({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          movie.image,
          fit: BoxFit.cover,
          width: screenWidth,
          height: screenHeight * 0.5,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: screenWidth,
              height: screenHeight * 0.5,
              color: Colors.grey[800],
              child: const Icon(
                Icons.movie,
                size: 64,
                color: Colors.white54,
              ),
            );
          },
        ),
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.4, 0.7, 1],
                  colors: [Colors.transparent, Colors.black26, Colors.black])),
        )),
        Positioned(
            top: 0,
            left: 8,
            child: IconButton(
                style: IconButton.styleFrom(backgroundColor: Colors.black54),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "${movie.releaseDate.length >= 4 ? movie.releaseDate.substring(0, 4) : 'N/A'} . ${movie.genres.join(' , ')} . ${movie.duration}",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ))
      ],
    );
  }
}
