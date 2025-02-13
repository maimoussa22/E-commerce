import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_screen_states.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../di/di.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_filed_widget.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    LoginScreenViewModel viewModel= getIt<LoginScreenViewModel>();

    return BlocListener<LoginScreenViewModel,LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if(state is LoginLoadingState){
          DialogUtils.showLoading(context, message: 'Loading...');
        }else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: state.error.errorMessage,
          title: 'Error',posActionName: 'Ok');
        }else if(state is LoginSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: 'Login Successfully',
          title: 'Success',posActionName: 'Ok',posAction: (){
            Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
              });
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.04,),
          child: Form(
            key: viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AssetsManager.routeLogoWhite,height: height*0.25,),
                  Text('Welcome Back To Route',style: AppStyles.semiBold24White,),
                  Text('Please sign in with your mail',style: AppStyles.light16White,),
                  SizedBox(height: height*0.03,),
                  Text('Email',style: AppStyles.medium18White,),
                  SizedBox(height: height*0.02,),
                  TextFiledWidget(hintText:'enter your email',
                    validator: Validators.validateEmail,
                    hintStyle: AppStyles.light18Black,
                    controller: viewModel.emailController,
                  ),
                  SizedBox(height: height*0.03,),
                  Text('Password',style: AppStyles.medium18White,),
                  SizedBox(height: height*0.02,),
                  TextFiledWidget(hintText:'enter your password',
                    validator: Validators.validatePassword,
                    obscureText: true,
                    hintStyle: AppStyles.light18Black,
                    controller: viewModel.passwordController,
                    suffixIcon: Image.asset(AssetsManager.visibleIcon),),
                  SizedBox(height: height*0.01,),
                  Text('Forget Password',
                    style: AppStyles.regular18White,
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(height: height*0.05,),
                  CustomElevatedButton(onButtonClicked: (){
                    viewModel.login();

                  },
                    text: 'Login',
                    textStyle: AppStyles.semiBold20Primary,
                    backgroundColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: height*0.03,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context,AppRoutes.registerRoute);
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
        ),
      ),
    );
  }
}