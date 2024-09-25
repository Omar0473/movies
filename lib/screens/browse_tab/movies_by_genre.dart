import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/tempelates/details_screen.dart';
import '../../home_screen/cubit/home_screen_cubit.dart';
import '../../home_screen/home_screen.dart';
import '../../tempelates/app_colors.dart';
import 'browse_cubit.dart';
import '../watchlist_tab/Api/GetMovieWatchListResponse.dart';
import 'browse_list_movies.dart';
//Abdelrahman hafez did this
class MoviesByGenreScreen extends StatelessWidget {
  final int genreId;
  final String genreName;
  const MoviesByGenreScreen({Key? key, required this.genreId, required this.genreName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined,
              color: AppColors.yellowColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                HomeScreenCubit.get(context).selectedIndex = 0;
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              child: const Icon(
                Icons.home,
                color: AppColors.yellowColor,
                size: 30,
              ),
            ),
          ),
        ],
        backgroundColor: AppColors.appBarColor,
        title: Text(genreName,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        centerTitle: true,
        toolbarHeight: 58.h,
      ),
      backgroundColor: AppColors.backGroundColor,
      body: BlocProvider(
        create: (context) => BrowseCubit()..loadMoviesByGenre(genreId),
        child: BlocBuilder<BrowseCubit, BrowseState>(
          builder: (context, state) {
            if (state is BrowseLoading) {
              return Center(child: CircularProgressIndicator(color:AppColors.yellowColor));
            } else if (state is BrowseMoviesLoaded) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  // Mapping to WatchListMovies model for BrowseListMovies
                  WatchListMovies browseMovie = WatchListMovies(
                    title: movie['title'],
                    posterPath: movie['poster_path'],
                    releaseDate: movie['release_date'],
                    backdropPath: movie['backdrop_path'],
                    voteAverage: movie['vote_average'],
                    id: movie['id'],
                    overview: movie['overview'],
                    genreIds: (movie['genre_ids'] as List<dynamic>).map((id) => id as int).toList()
                  );

                  return Padding(
                    padding: EdgeInsets.all(8.h),
                    child: InkWell(
                      splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap:(){
                          Navigator.pushNamed(context,'similarMovies_screen',arguments:browseMovie);
                        },
                        child: BrowseListMovies(movie: browseMovie)),
                  );
                },
              );
            } else if (state is BrowseError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text("No data available"));
            }
          },
        ),
      ),
    );
  }
}
