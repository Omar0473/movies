import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/screens/watchlist_tab/cubit/get_movies_watchlist_cubit.dart';
import 'package:movies/screens/watchlist_tab/cubit/get_movies_watchlist_states.dart';
import '../../tempelates/app_colors.dart';
import '../../tempelates/details_screen.dart';
import '../../tempelates/watch_list_card.dart';
import 'Api/GetMovieWatchListResponse.dart'; // Assuming this is where WatchListMovies is defined

class WatchList extends StatelessWidget {
  static const String routeName = 'watchlist';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35.h),
            Text(
              'Watchlist',
              style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            BlocBuilder<GetMoviesWatchListCubit, WatchListMoviesStates>(
              bloc: GetMoviesWatchListCubit.get(context)..getWatchListMovies(),
              builder: (context, state) {
                if (state is WatchListMoviesStatesSuccess) {
                  var moviesList = GetMoviesWatchListCubit.get(context).lista;
                  return Expanded(
                    child: GridView.builder(
                      itemCount: moviesList.length, // Length of the movies list
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Single column
                        crossAxisSpacing: 0,
                        mainAxisExtent: 125.h, // Adjusting the item height
                      ),
                      itemBuilder: (context, index) {
                        WatchListMovies movie = moviesList[index]; // Fetch movie from list
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
    Navigator.pushNamed(
    context, DetailsScreen.routeName,
    arguments: GetMoviesWatchListCubit.get(context)
        .lista[index]);
    }
                            ,
                            // Passing the movie to WatchListCard
                            child: WatchListCard(movie: movie),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  // Show loading indicator while data is loading
                  return SizedBox(
                    height: height * 0.45,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.yellowColor,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
