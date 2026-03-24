import 'package:cinmeatic/core/constants.dart';
import 'package:cinmeatic/data/Models/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/details', arguments: movie);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
                Radius.circular(AppConstants.radiusSmall))),
        width: AppConstants(context).movieCardWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Photo
            AspectRatio(
              aspectRatio: AppConstants(context).backdropAspectRatio,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppConstants.radiusSmall)),
                child: Image.asset(
                  movie.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[800],
                      child: const Icon(
                        Icons.movie,
                        size: 32,
                        color: Colors.white54,
                      ),
                    );
                  },
                ),
              ),
            ),

            // Text
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spaceSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppConstants.spaceSmall,
                          bottom: AppConstants.spaceSmall),
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
                          movie.releaseDate.length >= 4
                              ? movie.releaseDate.substring(0, 4)
                              : 'N/A',
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
      ),
    );
  }
}
