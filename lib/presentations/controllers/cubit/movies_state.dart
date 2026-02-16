part of 'movies_cubit.dart';

class MoviesState {
  final List<Movie> allmovies;
  final List<Movie> searchedMovies;
  final List<Movie> savedMovies;
  final bool isLoading;
  final String? errorMsg;
  const MoviesState({
    required this.allmovies,
    this.isLoading = false,
    this.errorMsg,
    this.searchedMovies = const [],
    this.savedMovies = const [],
  });
}

final class MoviesInitial extends MoviesState {
  MoviesInitial() : super(allmovies: []);
}

class MovieUpdate extends MoviesState {
  MovieUpdate({
    required super.allmovies,
    super.isLoading,
    super.errorMsg,
    super.searchedMovies,
    super.savedMovies,
  });
}
