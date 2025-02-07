import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce/features/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.loginRoute,
      routes: {
        AppRoutes.loginRoute : (context)=>LoginScreen(),
        AppRoutes.registerRoute : (context)=>RegisterScreen(),
      },
    );
  }

}

