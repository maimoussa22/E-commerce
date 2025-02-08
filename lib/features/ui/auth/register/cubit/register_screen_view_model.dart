import 'package:e_commerce/domain/use%20cases/register_use_case.dart';
import 'package:e_commerce/features/ui/auth/register/cubit/register_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterScreenViewModel extends Cubit<RegisterStates>{
  RegisterUseCase registerUseCase;
  RegisterScreenViewModel({required this.registerUseCase}):super(RegisterInitialState());

  TextEditingController nameController = TextEditingController(text: 'Ahmed');
  TextEditingController phoneController = TextEditingController(text: '01010700701');
  TextEditingController emailController = TextEditingController(text: 'maimussa22@gmail.com');
  TextEditingController passwordController = TextEditingController(text: 'Ahmed@123');
  TextEditingController rePasswordController = TextEditingController(text: 'Ahmed@123');

  final formKey = GlobalKey<FormState>();
  void register()async{
    if(formKey.currentState?.validate() == true){
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(nameController.text, emailController.text, 
          passwordController.text, rePasswordController.text,
          phoneController.text);
      either.fold((error){
        emit(RegisterErrorState(error: error));
      }, (response){
        emit(RegisterSuccessState(responseEntity: response));
      });
    }
  }

}