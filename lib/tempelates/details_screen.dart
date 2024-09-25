import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Api/end_points.dart';
import 'package:movies/home_screen/cubit/home_screen_cubit.dart';
import 'package:movies/home_screen/home_screen.dart';
import 'package:movies/screens/home_tab/Api/get_popular_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_similar_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_top_rated_movies_response.dart';
import 'package:movies/screens/home_tab/Api/get_upcoming_movies_response.dart';
import 'package:movies/screens/home_tab/cubit/get_movies_cubit.dart';
import 'package:movies/screens/home_tab/cubit/get_movies_states.dart';
import 'package:movies/screens/watchlist_tab/Api/GetMovieWatchListResponse.dart';
import 'package:movies/tempelates/poster_card.dart';
import 'package:movies/tempelates/similar_movie_card.dart';
import 'package:readmore/readmore.dart';
import 'app_colors.dart';
import 'movie_category.dart';

class DetailsScreen<T> extends StatelessWidget {
  static const String routeName = 'similarMovies_screen';
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var args = ModalRoute.of(context)?.settings.arguments as T;
    String? title;
    String? backdropPath;
    String? posterPath;
    double? voteAverage;
    String? overview;
    List<String>? genreNames;
    int? id;

// Dictionary for genre IDs
    Map<num, String> genreDict = {
      28: 'Action',
      12: 'Adventure',
      16: 'Animation',
      35: 'Comedy',
      80: 'Crime',
      99: 'Documentary',
      18: 'Drama',
      10751: 'Family',
      14: 'Fantasy',
      36: 'History',
      27: 'Horror',
      10402: 'Music',
      9648: 'Mystery',
      10749: 'Romance',
      878: 'Science Fiction',
      10770: 'TV Movie',
      53: 'Thriller',
      10752: 'War',
      37: 'Western'
    };

// Function to convert genreIds list to genre names
    List<String> getGenre(List<num> genreIds) {
      return genreIds.map((id) => genreDict[id] ?? 'Unknown').toList();
    }

// Inside your logic to assign movie details
    if (args is SimilarMoviesData) {
      title = args.title;
      backdropPath = args.backdropPath;
      posterPath = args.posterPath;
      voteAverage = args.voteAverage?.toDouble();
      overview = args.overview;
      id = args.id?.toInt();
      genreNames = getGenre(args.genreIds??[]);
    } else if (args is TopRatedMoviesData) {
      title = args.title;
      backdropPath = args.backdropPath;
      posterPath = args.posterPath;
      voteAverage = args.voteAverage?.toDouble();
      overview = args.overview;
      id = args.id?.toInt();
      genreNames = getGenre(args.genreIds??[]);
    } else if (args is PopularMoviesData) {
      title = args.title;
      backdropPath = args.backdropPath;
      posterPath = args.posterPath;
      voteAverage = args.voteAverage?.toDouble();
      overview = args.overview;
      id = args.id?.toInt();
      genreNames = getGenre(args.genreIds??[]);
    } else if (args is UpcomingMovieData) {
      title = args.title;
      backdropPath = args.backdropPath;
      posterPath = args.posterPath;
      voteAverage = args.voteAverage?.toDouble();
      overview = args.overview;
      id = args.id?.toInt();
      genreNames = getGenre(args.genreIds??[]);
    } else if (args is WatchListMovies) {
      title = args.title;
      backdropPath = args.backdropPath;
      posterPath = args.posterPath;
      voteAverage = args.voteAverage?.toDouble();
      overview = args.overview;
      id = args.id?.toInt();
      genreNames = getGenre(args.genreIds??[]);
    }
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar (
        leading: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: AppColors.yellowColor)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  HomeScreenCubit.get(context).selectedIndex = 0;
                  Navigator.pushNamed(context,HomeScreen.routeName);
                },
                child: const Icon(
                  Icons.home,
                  color: AppColors.yellowColor,
                  size: 30,
                )),
          )
        ],
        backgroundColor: AppColors.appBarColor,
        //leading:Icon(Icons.arrow_back_ios_new_outlined),
        title: Text(title ?? '',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        centerTitle: true,
        toolbarHeight: 58.h,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
                children: [
                Container  (
                decoration: const BoxDecoration(color: AppColors.sectionsColor),
                height: 245.h,
                width:width,
                child: CachedNetworkImage(
                  imageUrl: '${EndPoints.imagePath}$backdropPath',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.yellowColor)),
                  errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error_outline_sharp,
                          color: AppColors.yellowColor)),
                ),
              ),
                Positioned (
                  top: 95.h,
                  bottom: 100.h,
                  right: 176.w,
                  left: 176.w,
                  child: Image.asset('assets/images/play.png')),
            ]),
            SizedBox(height: 13.h),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('$title',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal)),
            ),
            SizedBox(height: 8.h),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Description',
                  style: TextStyle(
                      color: AppColors.descriptionColor,
                      fontSize: 12,
                      fontWeight: FontWeight.normal)),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: PosterCard(imagePath: posterPath ?? '',movieId: id?.toInt()??0,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12.w), // Adjust the left padding to move the tags to the right
                          child: Wrap(
                            spacing: 10.w, // Space between genre tags
                            runSpacing: 10.h, // Space between rows when wrapping
                            children: genreNames!.map((genreName) {
                              return MovieCategory(label: genreName);
                            }).take(genreNames.length > 3 ? 3 : genreNames.length).toList(),//Honestly it got me so headache so for now I will just have temp solution for the pixel overflow because it cant be controlled w more than 3 tags
                          ),
                        ),

                        SizedBox(height: 7.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: SizedBox(
                              width: 259.w,
                              height: 130.h,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      width:300.w,
                                      child: ReadMoreText(
                                        '$overview',
                                        style: const TextStyle(
                                            color: AppColors.descriptionColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal),
                                        trimMode: TrimMode.Line,
                                        trimLines: 5,
                                        lessStyle: const TextStyle(
                                            color: AppColors.yellowColor),
                                        moreStyle: const TextStyle(
                                            color: AppColors.yellowColor),
                                        trimCollapsedText: ' show more',
                                        trimExpandedText: ' show less',
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Image.asset('assets/images/star.png',
                                  scale: 0.555),
                            ),
                            SizedBox(width: 4.96.w),
                            Text('${voteAverage?.toStringAsFixed(1)}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 42.h),
            Container(
              color: AppColors.sectionsColor,
              width: 565.w,
              height: 275.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Text('More Like This',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(height: 12.87.h),
                  BlocBuilder<GetMoviesCubit, GetMoviesStates>(
                    bloc: GetMoviesCubit.get(context)
                      ..getSimilarMovies(id.toString()),
                    builder: (context, state) {
                      return GetMoviesCubit.get(context).similar.isNotEmpty
                          ?
                      Expanded(
                              child:
                              GridView.builder(
                                  itemCount: GetMoviesCubit.get(context)
                                      .similar
                                      .length,
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      crossAxisSpacing: 0,
                                      mainAxisExtent: 125),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                      const EdgeInsets.only(left: 16),
                                      child: InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, routeName,
                                                arguments: GetMoviesCubit.get(
                                                    context)
                                                    .similar[index]);
                                            //print('pressed✔️');
                                          },
                                          child: SimilarMovieCard(
                                              imagePath:
                                              GetMoviesCubit.get(context)
                                                  .similar[index]
                                                  .posterPath ??
                                                  '',
                                              title:
                                              GetMoviesCubit.get(context)
                                                  .similar[index]
                                                  .title ??
                                                  '',
                                              rating: GetMoviesCubit.get(context)
                                                  .similar[index]
                                                  .voteAverage!
                                                  .toDouble().toStringAsFixed(1)//Looking better now!
                                              ,
                                              details:
                                              GetMoviesCubit.get(context)
                                                  .similar[index]
                                                  .releaseDate!.length>4?
                                                  GetMoviesCubit.get(context).similar[index].releaseDate?.substring(0,4)??
                                                      '':GetMoviesCubit.get(context).similar[index].releaseDate??'',
                                            id: GetMoviesCubit.get(context)
                                              .similar[index].id!.toInt()??0,
                                          )
                                      ),
                                    );
                                  }
                              //MoviesListBuilder(
                              //   list:GetMoviesCubit.get(context).similar,
                              //   args:GetMoviesCubit.get(context).similar,
                              //   routeName:routeName,
                              //   item:SimilarMovieCard(title:GetMoviesCubit.get(context).similar,details: ,imagePath: ,rating: ,key: ,)
                              // ),
                              )
                      )
                          : const Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.yellowColor));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
