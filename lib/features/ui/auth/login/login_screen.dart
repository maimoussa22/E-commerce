import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_filed_widget.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsManager.routeLogoWhite,height: height*0.25,),
              Text('Welcome Back To Route',style: AppStyles.semiBold24White,),
              Text('Please sign in with your mail',style: AppStyles.light16White,),
              SizedBox(height: height*0.03,),
              Text('User Name',style: AppStyles.medium18White,),
              SizedBox(height: height*0.02,),
              TextFiledWidget(hintText:'enter your name',
                hintStyle: AppStyles.light18Black,),
              SizedBox(height: height*0.03,),
              Text('Password',style: AppStyles.medium18White,),
              SizedBox(height: height*0.02,),
              TextFiledWidget(hintText:'enter your password',
                obscureText: true,
                hintStyle: AppStyles.light18Black,
                suffixIcon: Image.asset(AssetsManager.visibleIcon),),
              SizedBox(height: height*0.01,),
              Text('Forget Password',
                style: AppStyles.regular18White,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: height*0.05,),
              CustomElevatedButton(onButtonClicked: (){},
                text: 'Login',
                textStyle: AppStyles.semiBold20Primary,
                backgroundColor: AppColors.whiteColor,
              ),
              SizedBox(height: height*0.03,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, AppRoutes.registerRoute);
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      children: [
                        TextSpan(
                            text: 'Don’t have an account? ',
                            style: AppStyles.medium18White
                        ),
                        TextSpan(
                            text: 'Create Account',
                            style: AppStyles.medium18White
                        )
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}