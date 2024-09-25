import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Api/api_config.dart';
import 'package:movies/screens/home_tab/Api/get_popular_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_similar_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_top_level_details_of_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_top_rated_movies_response.dart';
import 'package:movies/screens/home_tab/cubit/get_movies_states.dart';
import '../Api/get_upcoming_movies_response.dart';

class GetMoviesCubit extends Cubit<GetMoviesStates> {
  GetMoviesCubit() : super(UpcomingMoviesInitialState());

  //todo : hold data - handle logic
  static GetMoviesCubit get(context) => BlocProvider.of(context);
  List<UpcomingMovieData> upcoming = [];
  List<TopRatedMoviesData> topRated = [];
  List<PopularMoviesData> popular = [];
  List<SimilarMoviesData> similar = [];
  List<Genres> genres = [];
  String? releaseDate;
  String? runtime;

  void getUpcomingMovies() async {
    emit(UpcomingMoviesLoadingState());
    var either = await ApiConfig.getUpcomingMovies();
    either.fold((l) {
      //print('error: $l');
      emit(UpcomingMoviesErrorState(errorMsg: l));
    }, (r) {
      upcoming = r.results!;
      //print('response = ${upcoming.length.toInt()}');
      emit(UpcomingMoviesSuccessState(response: r));
    });
  }

  void getTopRatedMovies() async {
    emit(TopRatedMoviesInitialState());
    var either = await ApiConfig.getTopRatedMovies();
    either.fold((l) {
      //print('error: $l');
      emit(TopRatedMoviesErrorState(errorMsg: l));
    }, (r) {
      topRated = r.results!;
      //print('response = ${upcoming.length.toInt()}');
      emit(TopRatedMoviesSuccessState(response: r));
    });
  }

  void getPopularMovies() async {
    emit(PopularMoviesInitialState());
    var either = await ApiConfig.getPopularMovies();
    either.fold((l) {
      //print('error: $l');
      emit(PopularMoviesErrorState(errorMsg: l));
    }, (r) {
      popular = r.results!;
      //print('response = ${upcoming.length.toInt()}');
      emit(PopularMoviesSuccessState(response: r));
    });
  }

  void getSimilarMovies(String mId) async {
    emit(SimilarMoviesInitialState());
    var either = await ApiConfig.getSimilarMovies(mId);
    either.fold((l) {
      //print('error: $l');
      emit(SimilarMoviesErrorState(errorMsg: l));
    }, (r) {
      similar = r.results!;
      //print('response = ${upcoming.length.toInt()}');
      emit(SimilarMoviesSuccessState(response: r));
    });
  }

  void getTopLevelDetailsOfMovies(String mId) async {
    emit(TopLevelDetailsOfMoviesInitialState());
    var either = await ApiConfig.getTopLevelDetailsOfMovies(mId);
    either.fold((l) {
      //print('error: $l');
      emit(TopLevelDetailsOfMoviesErrorState(errorMsg: l));
    }, (r) {
      genres = r.genres!;
      releaseDate = r.releaseDate;
      runtime = r.runtime.toString();
      //print('response = ${upcoming.length.toInt()}');
      emit(TopLevelDetailsOfMoviesSuccessState(response: r));
    });
  }
}
