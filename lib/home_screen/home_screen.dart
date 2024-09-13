import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/home_screen/cubit/home_cubit.dart';
import 'package:movies/home_screen/cubit/home_screen_states.dart';
import 'package:movies/tempelates/app_colors.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  HomeCubit cubit = HomeCubit();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeScreenStates>(
      bloc:cubit,
      builder:(context,state){
        return    Scaffold(
            backgroundColor:AppColors.backGroundColor,
            bottomNavigationBar:BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/Home.png')),label:'HOME'),
                BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/Search.png')),label:'SEARCH'),
                BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/BROWSE.png')),label:'BROWSE'),
                BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/WATCHLIST.png')),label:'WATCHLIST'),
              ],
              onTap:(index){
                cubit.selectedIndex = index;
                setState(() {
                });
              },
              backgroundColor:AppColors.bottomNavigationBarColor,
              elevation:3,
              selectedItemColor:AppColors.yellowColor,
              currentIndex:cubit.selectedIndex,
              iconSize:30,
              unselectedItemColor:Colors.white,
              type:BottomNavigationBarType.fixed,
            ),
            body:cubit.screens[cubit.selectedIndex]
        );
      },
    );
  }
}
