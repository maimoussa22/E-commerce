import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';

import '../../../entities/RegisterResponseEntity.dart';

abstract class RemoteAuthDataSource{
  Future<Either<Failures,RegisterResponseEntity>> register(String name , String email , String password ,
      String rePassword,String phone);

  Future<Either<Failures,LoginResponseEntity>> login( String email , String password );
}