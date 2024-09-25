import 'package:movies/screens/home_tab/Api/get_popular_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_similar_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_top_level_details_of_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_top_rated_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_upcoming_movies_response.dart';
import '../../../tempelates/failures.dart';

abstract class GetMoviesStates {}

class UpcomingMoviesInitialState extends GetMoviesStates {}

class UpcomingMoviesLoadingState extends GetMoviesStates {}

class UpcomingMoviesErrorState extends GetMoviesStates {
  Failure errorMsg;

  UpcomingMoviesErrorState({required this.errorMsg});
}

class UpcomingMoviesSuccessState extends GetMoviesStates {
  GetUpcomingMoviesResponse response;

  UpcomingMoviesSuccessState({required this.response});
}

class TopRatedMoviesInitialState extends GetMoviesStates {}

class TopRatedMoviesLoadingState extends GetMoviesStates {}

class TopRatedMoviesErrorState extends GetMoviesStates {
  Failure errorMsg;

  TopRatedMoviesErrorState({required this.errorMsg});
}

class TopRatedMoviesSuccessState extends GetMoviesStates {
  GetTopRatedMoviesResponse response;

  TopRatedMoviesSuccessState({required this.response});
}

class PopularMoviesInitialState extends GetMoviesStates {}

class PopularMoviesLoadingState extends GetMoviesStates {}

class PopularMoviesErrorState extends GetMoviesStates {
  Failure errorMsg;

  PopularMoviesErrorState({required this.errorMsg});
}

class PopularMoviesSuccessState extends GetMoviesStates {
  GetPopularMoviesResponse response;

  PopularMoviesSuccessState({required this.response});
}

class SimilarMoviesInitialState extends GetMoviesStates {}

class SimilarMoviesLoadingState extends GetMoviesStates {}

class SimilarMoviesErrorState extends GetMoviesStates {
  Failure errorMsg;

  SimilarMoviesErrorState({required this.errorMsg});
}

class SimilarMoviesSuccessState extends GetMoviesStates {
  GetSimilarMoviesResponse response;

  SimilarMoviesSuccessState({required this.response});
}

class TopLevelDetailsOfMoviesInitialState extends GetMoviesStates {}

class TopLevelDetailsOfMoviesLoadingState extends GetMoviesStates {}

class TopLevelDetailsOfMoviesErrorState extends GetMoviesStates {
  Failure errorMsg;

  TopLevelDetailsOfMoviesErrorState({required this.errorMsg});
}

class TopLevelDetailsOfMoviesSuccessState extends GetMoviesStates {
  GetTopLevelDetailsOfMoviesResponse response;

  TopLevelDetailsOfMoviesSuccessState({required this.response});
}
