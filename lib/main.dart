import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_screen_view_model.dart';
import 'package:e_commerce/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce/features/ui/auth/register/register_screen.dart';
import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerce/features/ui/pages/home_screen/homeScreen.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc_observer.dart';
import 'di/di.dart';
import 'features/ui/auth/register/cubit/register_screen_view_model.dart';
import 'features/ui/pages/home_screen/tabs/category_tab/cubit/category_tab_view_model.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<RegisterScreenViewModel>()),
            BlocProvider(create: (_) => getIt<LoginScreenViewModel>()),
            BlocProvider(create: (_) => getIt<HomeTabViewModel>()),
            BlocProvider(create: (_) => getIt<CategoryTabViewModel>()),
          ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
          theme: AppTheme.light,
        initialRoute: AppRoutes.loginRoute,
        routes: {
          AppRoutes.loginRoute : (context)=>LoginScreen(),
          AppRoutes.registerRoute : (context)=>RegisterScreen(),
          AppRoutes.homeRoute : (context)=>HomeScreen(),
        },
      ),
    );
  }

}

