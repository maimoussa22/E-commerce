import 'package:e_commerce/domain/use%20cases/login_use_case.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginScreenViewModel extends Cubit<LoginStates>{
  LoginUseCase loginUseCase;
  LoginScreenViewModel({required this.loginUseCase}):super(LoginInitialState());

  TextEditingController emailController = TextEditingController(text: 'maimossa@gmail.com');
  TextEditingController passwordController = TextEditingController(text: 'Ahmed@123');

  final formKey = GlobalKey<FormState>();

  void login()async{
    if(formKey.currentState?.validate() == true){
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(emailController.text,
          passwordController.text);
      either.fold((error){
        emit(LoginErrorState(error: error));
      }, (response){
        emit(LoginSuccessState(responseEntity: response));
      });
    }
  }

}