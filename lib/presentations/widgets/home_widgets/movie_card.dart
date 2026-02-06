import 'package:cinmeatic/data/Models/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  Movie movie;
  double cardHeight;
  double screenWidth;
   MovieCard(
      {super.key, required this.movie,
      required this.cardHeight,
      required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff1F1D35),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      width: screenWidth * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Photo
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                movie.image,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Padding(
                    padding: EdgeInsets.only(
                        top: cardHeight * 0.01, bottom: cardHeight * 0.02),
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  // details
                  Row(
                    children: [
                      Text(movie.duration,
                          style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        movie.releaseDate.substring(0, 4),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Spacer(),
                     
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.blueGrey, shape: BoxShape.circle),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 20,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.download,
                            color: Colors.white70,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
