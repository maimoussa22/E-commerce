import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';

abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginErrorState extends LoginStates{
  Failures error;
  LoginErrorState({required this.error});
}
class LoginSuccessState extends LoginStates{
  LoginResponseEntity responseEntity ;
  LoginSuccessState({required this.responseEntity});
}