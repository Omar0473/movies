import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/home_screen/cubit/home_screen_cubit.dart';
import 'package:movies/home_screen/cubit/home_screen_states.dart';
import '../tempelates/app_colors.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenStates>(
      bloc: HomeScreenCubit.get(context),
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.backGroundColor,
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/Home.png')),
                    label: 'HOME'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/Search.png')),
                    label: 'SEARCH'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/BROWSE.png')),
                    label: 'BROWSE'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/WATCHLIST.png')),
                    label: 'WATCHLIST'),
              ],
              onTap: (index) {
                setState(() {
                  HomeScreenCubit.get(context).selectedIndex = index;
                });
              },
              backgroundColor: AppColors.bottomNavigationBarColor,
              elevation: 3,
              selectedItemColor: AppColors.yellowColor,
              currentIndex: HomeScreenCubit.get(context).selectedIndex,
              iconSize: 30,
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
            ),
            body: HomeScreenCubit.get(context)
                .screens[HomeScreenCubit.get(context).selectedIndex]);
      },
    );
  }
}
