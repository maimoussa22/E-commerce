import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';

import '../../../entities/RegisterResponseEntity.dart';

abstract class RemoteAuthDataSource{
  Future<Either<Failures,RegisterResponseEntity>> register(String name , String email , String password ,
      String rePassword,String phone);
}