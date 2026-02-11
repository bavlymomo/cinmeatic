import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieButton extends StatefulWidget {
  final Movie movie;
  final double sizeIcon;
  const MovieButton({super.key, required this.movie, required this.sizeIcon});

  @override
  State<MovieButton> createState() => _MovieButtonState();
}

class _MovieButtonState extends State<MovieButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            widget.movie.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: 5,
            right: 5,
            child: InkWell(
              child: Icon(
                Icons.favorite,
                size: widget.sizeIcon,
                color: isPressed ? Colors.red : Colors.white,
              ),
              onTap: () {
                  context.read<MoviesCubit>().saveMovie(widget.movie.id);
              },
            ))
      ]),
    );
  }
}
