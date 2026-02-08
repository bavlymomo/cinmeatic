part of 'movies_cubit.dart';

sealed class MoviesState {
  List<Movie> allmovies;
  List<Movie> searchedMovies;
  final bool isLoading;
  final String? errorMsg;
  MoviesState(
      {required this.allmovies,
      this.isLoading = false,
      this.errorMsg,
      this.searchedMovies =const []});
}

final class MoviesInitial extends MoviesState {
  MoviesInitial() : super(allmovies: []);
}

class MovieUpdate extends MoviesState {
  MovieUpdate(
      {required super.allmovies,
      super.isLoading,
      super.errorMsg,
      super.searchedMovies});
}
