import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../tempelates/app_colors.dart';

class Search extends StatelessWidget {
  static const String routeName = 'search';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Column(
          children: [
            //SizedBox(height: 40), // Add SizedBox with height 20 here
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
              child: SearchBar(),
            ),
            Expanded(
              child: Center(
                child: NoMoviesFound(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: AppColors.mainTextColor),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(color: AppColors.descriptionColor),
        prefixIcon: const Icon(Icons.search, color: AppColors.mainTextColor),
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class NoMoviesFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.local_movies,
          size: 100,
          color: AppColors.bookmarkColor,
        ),
        SizedBox(height: 20),
        Text(
          'No movies found',
          style: TextStyle(
            color: AppColors.bookmarkColor,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
