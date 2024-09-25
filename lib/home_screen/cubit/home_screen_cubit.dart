import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/home_screen/cubit/home_screen_states.dart';
import '../../screens/browse_tab/browse_tab.dart';
import '../../screens/home_tab/home_tab.dart';
import '../../screens/search_tab/search_tab.dart';
import '../../screens/watchlist_tab/watchlist_tab.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates>{

  HomeScreenCubit():super(HomeScreenInitialState());

  //todo : hold data - handle logic

  static HomeScreenCubit get(context)=>BlocProvider.of(context);

  List<Widget> screens = [Home(),Search(), Browse(),WatchList()];

  int selectedIndex = 0;

}