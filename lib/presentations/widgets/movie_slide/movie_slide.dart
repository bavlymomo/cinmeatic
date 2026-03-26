import 'package:cinmeatic/core/constants.dart';
import 'package:cinmeatic/data/Models/movie.dart';
import 'package:flutter/material.dart';

abstract class MovieSlide extends StatelessWidget {
  final Movie movie;

  const MovieSlide({super.key, required this.movie});

  Widget buildActionwidget(BuildContext context);
  Widget buildBottomPart(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final String subtitle;
    if (movie.genres.length > 2) {
      subtitle = movie.genres.take(2).join(' , ');
    } else {
      subtitle = movie.genres.join(' , ');
    }
    return AspectRatio(
      aspectRatio: 30 / 12,
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xff1F1D35),
            borderRadius:
                BorderRadius.all(Radius.circular(AppConstants.radiusMedium))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.asset(
                    movie.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.spaceSmall),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Text(
                            movie.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            subtitle,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                      buildBottomPart(context),
                    ],
                  ),
                ),
              ),
              Expanded(child: buildActionwidget(context))
            ],
          ),
        ),
      ),
    );
  }
}
