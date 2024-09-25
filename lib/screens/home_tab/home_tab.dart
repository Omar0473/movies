import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/screens/home_tab/cubit/get_movies_cubit.dart';
import 'package:movies/screens/home_tab/cubit/get_movies_states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../tempelates/app_colors.dart';
import '../../tempelates/details_screen.dart';
import '../../tempelates/new_releases_cards.dart';
import '../../tempelates/popular_movies_secion.dart';
import '../../tempelates/recommended_card.dart';


class Home extends StatelessWidget {
  static const String routeName = 'home';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoviesCubit, GetMoviesStates>(
        bloc: GetMoviesCubit.get(context)
          ..getTopRatedMovies()
          ..getUpcomingMovies()
          ..getPopularMovies(),
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                //SizedBox(height:20.h),
                GetMoviesCubit.get(context).popular.isNotEmpty
                    ? SizedBox(
                        height: 325.h,
                        child: CarouselSlider.builder(
                            itemCount:
                                GetMoviesCubit.get(context).popular.length,
                            itemBuilder: (context, index, realIndex) {
                              return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, DetailsScreen.routeName,
                                        arguments: GetMoviesCubit.get(context)
                                            .popular[index]);
                                  },
                                  child: PopularMoviesSection(
                                      popularMoviesData:
                                          GetMoviesCubit.get(context)
                                              .popular[index]));
                            },
                            options: CarouselOptions(
                              height: 280.h,
                              //height
                              viewportFraction: 1,
                              //width
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 3),
                              pauseAutoPlayOnTouch: true,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                              enlargeFactor: 3,
                            )),
                      )
                    :
                    // SizedBox(
                    //     height:290.h,
                    //     child:
                    //     GridView.builder(
                    //         itemCount:GetMoviesCubit.get(context).popular.length,
                    //         scrollDirection:Axis.horizontal,
                    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //           crossAxisCount:1,
                    //           //crossAxisSpacing:100.h,
                    //           mainAxisExtent:413.w,
                    //           //mainAxisSpacing:20
                    //         ),
                    //         itemBuilder:(context,index){
                    //           return InkWell(
                    //               splashColor:Colors.transparent,
                    //               highlightColor:Colors.transparent,
                    //               onTap:(){
                    //                 Navigator.pushNamed(context,DetailsScreen.routeName,arguments:GetMoviesCubit.get(context).popular[index]);
                    //               },
                    //               child: Padding(
                    //                 padding: const EdgeInsets.only(top:7,bottom:7,left:3,right:3),
                    //                 child: PopularMoviesSection(popularMoviesData:GetMoviesCubit.get(context).popular[index]),
                    //               )
                    //           );
                    //         }
                    //     )
                    // ):
                    SizedBox(
                        height: 130.h,
                        child: const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.yellowColor))),
                SizedBox(height: 15.h),
                Container(
                  color: AppColors.sectionsColor,
                  width: 420.w,
                  height: 210.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text('New Releases',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(height: 12.87.h),
                      GetMoviesCubit.get(context).upcoming.isNotEmpty
                          ? Expanded(
                              child: GridView.builder(
                                  itemCount: GetMoviesCubit.get(context)
                                      .upcoming
                                      .length,
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          crossAxisSpacing: 0,
                                          mainAxisExtent: 125),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 13),
                                      child: InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                DetailsScreen.routeName,
                                                arguments:
                                                    GetMoviesCubit.get(context)
                                                        .upcoming[index]);
                                            //print('pressed');
                                          },
                                          child: NewReleasesCard(
                                              movieData:
                                                  GetMoviesCubit.get(context)
                                                      .upcoming[index])),
                                    );
                                  }))
                          : SizedBox(
                              height: 130.h,
                              child: const Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.yellowColor))),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  color: AppColors.sectionsColor,
                  width: 565.w,
                  height: 276.h, // Keep height as per your design
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          'Recommended',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 13.h),

                      // Wrap GridView.builder inside a Flexible or SizedBox
                      GetMoviesCubit.get(context).topRated.isNotEmpty
                          ? Flexible(
                              child: GridView.builder(
                                itemCount:
                                    GetMoviesCubit.get(context).topRated.length,
                                scrollDirection: Axis.horizontal,
                                // Scroll horizontally
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 0,
                                  mainAxisExtent: 125, // Width of each item
                                ),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, DetailsScreen.routeName,
                                            arguments:
                                                GetMoviesCubit.get(context)
                                                    .topRated[index]);
                                      },
                                      child: RecommendedCard(
                                          moviesData: GetMoviesCubit.get(
                                                      context)
                                                  .topRated[
                                              index]), // Your custom card widget
                                    ),
                                  );
                                },
                              ),
                            )
                          : SizedBox(
                              height: 130.h,
                              child: const Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.yellowColor))),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
