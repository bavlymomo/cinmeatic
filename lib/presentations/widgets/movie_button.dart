import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieButton extends StatefulWidget {
  final List<Movie> likedMovies;
  final Movie movie;
  final double sizeIcon;
  const MovieButton(
      {super.key,
      required this.movie,
      required this.sizeIcon,
      required this.likedMovies});

  @override
  State<MovieButton> createState() => _MovieButtonState();
}

class _MovieButtonState extends State<MovieButton> {
  double _scale = 1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/details', arguments: widget.movie);
      },
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            widget.movie.image,
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
        Positioned(
            top: 5,
            right: 5,
            child: InkWell(
              child: AnimatedScale(
                duration: const Duration(seconds: 1),
                scale: _scale,
                curve: Curves.elasticOut,
                child: Icon(Icons.favorite,
                    size: widget.sizeIcon,
                    color:
                        widget.likedMovies.any((e) => e.id == widget.movie.id)
                            ? Colors.red
                            : Colors.white),
              ),
              onTap: () {
                setState(() {
                  _scale = _scale == 1 ? 1.5 : 1;
                });
                context.read<MoviesCubit>().toggleSaveMovie(widget.movie.id);
              },
            ))
      ]),
    );
  }
}
