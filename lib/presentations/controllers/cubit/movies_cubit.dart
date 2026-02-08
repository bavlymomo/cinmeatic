import 'package:bloc/bloc.dart';
import 'package:cinmeatic/data/Models/movie.dart';
import 'package:cinmeatic/data/data_source/movie_list_api.dart';
part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  void fetchMovies() async {
    emit(MovieUpdate(allmovies: const [], isLoading: true));
    try {
      List<Movie> movies = await MovielistApi.loadJson();
      emit(MovieUpdate(allmovies: movies, isLoading: false));
    } catch (e) {
      emit(MovieUpdate(
          allmovies: const [], isLoading: false, errorMsg: e.toString()));
    }
  }

  void searchMovie(String name) {
    final query = name.trim().toLowerCase();

    final List<Movie> updatedList = query.isEmpty
        ? []
        : state.allmovies.where((e) {
            return e.title.toLowerCase().contains(query);
          }).toList();
    print("Query: $query");
    print("Total movies: ${state.allmovies.length}");
    print("Filtered movies: ${updatedList.length}");
    emit(MovieUpdate(
      allmovies: state.allmovies,
      searchedMovies: updatedList,
    ));
  }
}
