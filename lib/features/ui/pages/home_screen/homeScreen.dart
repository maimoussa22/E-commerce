import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AssetsManager.routeLogoPrimary),
      ),
      body: viewModel.tabs[viewModel.selectedIndex],

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight:Radius.circular(15)
        ),
        child: BottomNavigationBar(
            backgroundColor: AppColors.primaryColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: AppColors.primaryColor,
            showUnselectedLabels: false,
            currentIndex: viewModel.selectedIndex,
            onTap:(index){
            viewModel.selectedIndex =index ;
            setState(() {

            });
            }, items: [
              bottomNavigationBarItem(
                  selectedIcon: AssetsManager.homeSelectedIcon,
                  unSelectedIcon: AssetsManager.homeIcon,
                  isSelected: viewModel.selectedIndex == 0
              ),
          bottomNavigationBarItem(
                  selectedIcon: AssetsManager.categorySelectedIcon,
                  unSelectedIcon: AssetsManager.categoryIcon,
                  isSelected: viewModel.selectedIndex == 1
              ),
          bottomNavigationBarItem(
                  selectedIcon: AssetsManager.favouriteSelectedIcon,
                  unSelectedIcon: AssetsManager.favouriteIcon,
                  isSelected: viewModel.selectedIndex == 2
              ),
          bottomNavigationBarItem(
                  selectedIcon: AssetsManager.profileSelectedIcon,
                  unSelectedIcon: AssetsManager.profileIcon,
                  isSelected: viewModel.selectedIndex == 3
              ),
              ]
      )
      )
    );

  }

BottomNavigationBarItem bottomNavigationBarItem({required String selectedIcon,
  required String unSelectedIcon,required bool isSelected}){
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        backgroundColor: isSelected ? AppColors.whiteColor : AppColors.transparentColor ,
          foregroundColor: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
          radius: 20,
          child: Image.asset(isSelected ? selectedIcon : unSelectedIcon)
      ),
    label: '',
    ) ;
  }
}