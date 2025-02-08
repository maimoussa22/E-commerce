import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce/features/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc_observer.dart';
import 'di/di.dart';
import 'features/ui/auth/register/cubit/register_screen_view_model.dart';

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
          ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        initialRoute: AppRoutes.loginRoute,
        routes: {
          AppRoutes.loginRoute : (context)=>LoginScreen(),
          AppRoutes.registerRoute : (context)=>RegisterScreen(),
        },
      ),
    );
  }

}

