import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Api/api_config.dart';
import 'package:movies/screens/watchlist_tab/cubit/get_movies_watchlist_states.dart';

import '../Api/GetMovieWatchListResponse.dart';

class GetMoviesWatchListCubit extends Cubit<WatchListMoviesStates>{
  GetMoviesWatchListCubit():super(WatchListMoviesStatesInitial());
  //todo : hold data - handle logic
  List<WatchListMovies> lista = [];
  static GetMoviesWatchListCubit get(context)=>BlocProvider.of(context);
  Future<void> getWatchListMovies() async {
    emit(WatchListMoviesStatesLoading());
    var either = await ApiConfig.getMoviesWatchList();
    either.fold((l) => emit(WatchListMoviesStatesError(failure: l)),
            (r){
      lista = r.results!;
      emit(WatchListMoviesStatesSuccess(watchListResponse: r));
            });

  }

}