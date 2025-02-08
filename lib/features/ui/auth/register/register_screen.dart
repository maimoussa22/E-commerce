import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/ui/auth/register/cubit/register_screen_states.dart';
import 'package:e_commerce/features/ui/auth/register/cubit/register_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_filed_widget.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   RegisterScreenViewModel viewModel= getIt<RegisterScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocListener<RegisterScreenViewModel,RegisterStates>(
      bloc: viewModel,
      listener: (context,state){
        if(state is RegisterLoadingState){
          DialogUtils.showLoading(context, message: 'Loading....');
        }else if(state is RegisterErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: state.error.errorMessage,
          posActionName: 'Ok',title: 'Error');
        }else if(state is RegisterSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context,
              message: 'Register Successfully',
          title: 'Success',
          posActionName: 'Ok');
        }
      },
      child:Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.04,),
          child: SingleChildScrollView(
            child: Form(
              key:viewModel.formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AssetsManager.routeLogoWhite,height: height*0.25,),
                  Text('Full Name',style: AppStyles.medium18White,),
                  SizedBox(height: height*0.01,),
                  TextFiledWidget(hintText:'enter your full name',
                    hintStyle: AppStyles.light18Black,
                    controller: viewModel.nameController,
                    validator: Validators.validateName,
                  ),
                  SizedBox(height: height*0.03,),
                  Text('Mobile Number',style: AppStyles.medium18White,),
                  SizedBox(height: height*0.01,),
                  TextFiledWidget(hintText: 'enter your mobile no.',
                    hintStyle: AppStyles.light18Black,
                    controller: viewModel.phoneController,
                    validator: Validators.validatePhone,
                  ),
                  SizedBox(height: height*0.03,),
                  Text('E-mail address',style: AppStyles.medium18White,),
                  SizedBox(height: height*0.01,),
                  TextFiledWidget(hintText:'enter your email address',
                    hintStyle: AppStyles.light18Black,
                    controller: viewModel.emailController,
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(height: height*0.03,),
                  Text('Password',style: AppStyles.medium18White,),
                  SizedBox(height: height*0.01,),
                  TextFiledWidget(hintText:'enter your password',
                    obscureText: true,
                    hintStyle: AppStyles.light18Black,
                    controller: viewModel.passwordController,
                    validator: Validators.validatePassword,
                    suffixIcon: Image.asset(AssetsManager.visibleIcon),),
                  SizedBox(height: height*0.03,),
                  Text('rePassword',style: AppStyles.medium18White,),
                  SizedBox(height: height*0.01,),
                  TextFiledWidget(hintText:'enter your rePassword',
                    obscureText: true,
                    hintStyle: AppStyles.light18Black,
                    controller: viewModel.rePasswordController,
                    validator: (value)=>Validators.validateRePassword(value,viewModel.passwordController.text),
                    suffixIcon: Image.asset(AssetsManager.visibleIcon),),
                  SizedBox(height: height*0.03,),
                  CustomElevatedButton(onButtonClicked: (){
                    viewModel.register();
                    setState(() {

                    });
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
        ),
      ) ,
    );
  }
}