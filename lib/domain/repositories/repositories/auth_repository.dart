import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:injectable/injectable.dart';


abstract class AuthRepository{
  Future<Either<Failures,RegisterResponseEntity>> register(String name , String email , String password ,
      String rePassword,String phone);
}