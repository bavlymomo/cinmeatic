import 'package:bloc/bloc.dart';
import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/data/data_source/movie_list_api.dart';
part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  void fetchMovies() async {
    emit(MovieUpdate(
        allmovies: state.allmovies,
        savedMovies: state.savedMovies,
        isLoading: true));
    try {
      List<Movie> movies = await MovielistApi.loadJson();
      emit(MovieUpdate(
          allmovies: movies, savedMovies: state.savedMovies, isLoading: false));
    } catch (e) {
      emit(MovieUpdate(
          allmovies: state.allmovies,
          savedMovies: state.savedMovies,
          isLoading: false,
          errorMsg: e.toString()));
    }
  }

  void searchMovie(String name) {
    final query = name.trim().toLowerCase();

    final List<Movie> updatedList = query.isEmpty
        ? []
        : state.allmovies.where((e) {
            return e.title.toLowerCase().contains(query);
          }).toList();
    emit(MovieUpdate(
      allmovies: state.allmovies,
      searchedMovies: updatedList,
    ));
  }

  void toggleSaveMovie(int id) {
    Movie movie = state.allmovies.firstWhere((e) => e.id == id);
    if (state.savedMovies.any((ele) => ele.id == id)) {
      List<Movie> updatedList =
          state.savedMovies.where((e) => e.id != id).toList();
      emit(MovieUpdate(allmovies: state.allmovies, savedMovies: updatedList));
    } else {
      emit(MovieUpdate(
        allmovies: state.allmovies,
        savedMovies: [...state.savedMovies, movie],
      ));
    }
  }

  void deleteSavedMovie(int id) {
    emit(MovieUpdate(
        allmovies: state.allmovies,
        savedMovies: state.savedMovies.where((e) => e.id != id).toList()));
  }

  void downloadMovie(int id) {
    Movie movie = state.allmovies.firstWhere((e) => e.id == id);
    if (state.downloadedMovies.contains(movie)) {
      emit(MovieUpdate(
          allmovies: state.allmovies,
          downloadedMovies: state.downloadedMovies));
    } else {
      emit(MovieUpdate(
        allmovies: state.allmovies,
        downloadedMovies: [...state.downloadedMovies, movie],
      ));
    }
  }
  // void DownloadMovie(int id) {
  //   Movie movie = state.allmovies.firstWhere((e) => e.id == id);
  //   if (state.savedMovies.any((ele) => ele.id == id)) {
  //     List<Movie> updatedList =
  //         state.savedMovies.where((e) => e.id != id).toList();
  //     emit(MovieUpdate(allmovies: state.allmovies, savedMovies: updatedList));
  //   } else {
  //     emit(MovieUpdate(
  //       allmovies: state.allmovies,
  //       savedMovies: [...state.savedMovies, movie],
  //     ));
  //   }
  // }
}
