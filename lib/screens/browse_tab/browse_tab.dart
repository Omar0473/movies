import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../tempelates/app_colors.dart';
import 'browse_cubit.dart';
import 'movies_by_genre.dart';
class Browse extends StatelessWidget {
  static const String routeName = 'browse';
  List<String> imagePaths = [
    'assets/images/action.jpeg',
    'assets/images/adventure.jpg',
    'assets/images/animation.jpg',
    'assets/images/comedy.jpg',
    'assets/images/crime.jpg',
    'assets/images/documentary.jpeg',
    'assets/images/drama.jpg',
    'assets/images/family.jpg',
    'assets/images/fantasy.jpg',
    'assets/images/history.jpg',
    'assets/images/horror.jpg',
    'assets/images/music.jpg',
    'assets/images/mystery.png',
    'assets/images/romance.jpg',
    'assets/images/fiction.webp',
    'assets/images/tv.webp',
    'assets/images/thriller.jpg',
    'assets/images/war.jpg',
    'assets/images/western.webp',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'Browse Category',
              style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 28.sp,
                fontWeight: FontWeight.normal,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: BlocBuilder<BrowseCubit, BrowseState>(
                builder: (context, state) {
                  if (state is BrowseLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: AppColors.yellowColor),
                    );
                  } else if (state is BrowseLoaded) {
                    return GridView.builder(
                      itemCount: state.genres.length, // Update the count based on loaded genres
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 30.h,
                        childAspectRatio: 16 / 9,
                      ),
                      itemBuilder: (context, index) {
                        final genre = state.genres[index];
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoviesByGenreScreen(
                                  genreId: genre['id'],
                                  genreName: genre['name'],
                                ),
                              ),
                            );                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                ),
                                child: Center(
                                  child: ClipRRect(
                                      borderRadius:BorderRadius.circular(10),
                                      child: Image.asset('${imagePaths[index]}',fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,))
                                ),
                              ),
                              Text(
                                genre['name'], // Show genre name
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is BrowseError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: TextStyle(color: AppColors.errorColor),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "No data available",
                        style: TextStyle(color: AppColors.secondaryTextColor),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
