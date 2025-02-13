import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_sources/remote_auth_data_source.dart';
import 'package:e_commerce/domain/repositories/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  RemoteAuthDataSource authDataSource;
  AuthRepositoryImpl({required this.authDataSource});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async{

    var either = await authDataSource.register(name, email, password, rePassword, phone);

    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password) async{
    var either = await authDataSource.login( email, password);

    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

}