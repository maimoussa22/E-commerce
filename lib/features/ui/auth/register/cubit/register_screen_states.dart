import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';

abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  Failures error;
  RegisterErrorState({required this.error});
}
class RegisterSuccessState extends RegisterStates{
  RegisterResponseEntity responseEntity ;
  RegisterSuccessState({required this.responseEntity});
}