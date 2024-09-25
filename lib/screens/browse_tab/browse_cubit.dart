import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Api/api_config.dart';
class BrowseState {}

class BrowseLoading extends BrowseState {}

class BrowseLoaded extends BrowseState {
  final List<dynamic> genres;

  BrowseLoaded(this.genres);
}

class BrowseMoviesLoaded extends BrowseState {
  final List<dynamic> movies;

  BrowseMoviesLoaded(this.movies);
}

class BrowseError extends BrowseState {
  final String message;

  BrowseError(this.message);
}

class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit() : super(BrowseLoading());

  // Fetch genres from API
  Future<void> loadGenres() async {
    try {
      emit(BrowseLoading());
      final genres = await ApiConfig.getGenres();
      emit(BrowseLoaded(genres));
    } catch (error) {
      emit(BrowseError('Failed to load categories: $error'));
    }
  }

  // Fetch movies by genre from API
  Future<void> loadMoviesByGenre(int genreId) async {
    try {
      emit(BrowseLoading());
      final movies = await ApiConfig.getMoviesByGenre(genreId);
      emit(BrowseMoviesLoaded(movies));
    } catch (error) {
      emit(BrowseError('Failed to load movies: $error'));
    }
  }
}
