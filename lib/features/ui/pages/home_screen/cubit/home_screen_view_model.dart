import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/category_tab/category_tab.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/favourite_tab.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/home_tab.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/profile_tab.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeScreenInitialState());

  List<Widget> tabs= [
    HomeTab(),
    CategoryTab(),
    FavouriteTab(),
    ProfileTab()
  ];
  int selectedIndex = 0;

}