import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/home_screen/cubit/home_screen_states.dart';
import '../../screens/browse_tab/browse_tab.dart';
import '../../screens/home_tab/home_tab.dart';
import '../../screens/search_tab/search_tab.dart';
import '../../screens/watchlist_tab/watchlist_tab.dart';
class HomeCubit extends Cubit<HomeScreenStates>{
  HomeCubit():super(HomeScreenInitialState());
  //todo : hold data - handle logic
  List<Widget> screens = [Home(),Search(),Browse(),WatchList()];
  int selectedIndex = 0;
}