import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/home_screen/cubit/home_screen_cubit.dart';
import 'package:movies/home_screen/home_screen.dart';
import 'package:movies/screens/browse_tab/browse_cubit.dart';
import 'package:movies/screens/browse_tab/browse_tab.dart';
import 'package:movies/screens/home_tab/cubit/get_movies_cubit.dart';
import 'package:movies/screens/home_tab/home_tab.dart';
import 'package:movies/screens/splash_screen/splash_screen.dart';
import 'package:movies/screens/watchlist_tab/cubit/get_movies_watchlist_cubit.dart';
import 'package:movies/screens/watchlist_tab/watchlist_tab.dart';
import 'package:movies/tempelates/details_screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => GetMoviesCubit()),
    BlocProvider(create: (context) => HomeScreenCubit()),
    BlocProvider(create: (context)=>GetMoviesWatchListCubit()),
  BlocProvider(create: (context) => BrowseCubit()..loadGenres()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.SplashScreenRoute,
          routes: {
            SplashScreen.SplashScreenRoute: (context) => SplashScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            Home.routeName: (context) => Home(),
            DetailsScreen.routeName: (context) => DetailsScreen(),
            WatchList.routeName:(context)=>WatchList(),
            Browse.routeName:(context)=>Browse()
          },
        );
      },
    );
  }
}
