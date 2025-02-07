import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_filed_widget.dart';

class RegisterScreen extends StatelessWidget{
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
              Text('Full Name',style: AppStyles.medium18White,),
              SizedBox(height: height*0.01,),
              TextFiledWidget(hintText:'enter your full name',
                hintStyle: AppStyles.light18Black,),
              SizedBox(height: height*0.03,),
              Text('Mobile Number',style: AppStyles.medium18White,),
              SizedBox(height: height*0.01,),
              TextFiledWidget(hintText: 'enter your mobile no.',
                hintStyle: AppStyles.light18Black,),
              SizedBox(height: height*0.03,),
              Text('E-mail address',style: AppStyles.medium18White,),
              SizedBox(height: height*0.01,),
              TextFiledWidget(hintText:'enter your email address',
                hintStyle: AppStyles.light18Black,),
              SizedBox(height: height*0.03,),
              Text('Password',style: AppStyles.medium18White,),
              SizedBox(height: height*0.01,),
              TextFiledWidget(hintText:'enter your password',
                obscureText: true,
                hintStyle: AppStyles.light18Black,
                suffixIcon: Image.asset(AssetsManager.visibleIcon),),
              SizedBox(height: height*0.03,),
              CustomElevatedButton(onButtonClicked: (){
                Navigator.pushNamed(context, AppRoutes.loginRoute);
              },
                text: 'Sign up',
                textStyle: AppStyles.semiBold20Primary,
                backgroundColor: AppColors.whiteColor,
              ),
              SizedBox(height: height*0.03,),
            ],
          ),
        ),
      ),
    );
  }


}