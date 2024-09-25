import '../../../tempelates/failures.dart';
import '../Api/GetMovieWatchListResponse.dart';

abstract class WatchListMoviesStates{}
  class WatchListMoviesStatesInitial extends WatchListMoviesStates {}
  class WatchListMoviesStatesLoading extends WatchListMoviesStates {}
  class WatchListMoviesStatesSuccess extends WatchListMoviesStates {
    GetMovieWatchListResponse watchListResponse;
    WatchListMoviesStatesSuccess({required this.watchListResponse});
  }
  class WatchListMoviesStatesError extends WatchListMoviesStates   {
    Failure failure;

    WatchListMoviesStatesError({required this.failure});
  }