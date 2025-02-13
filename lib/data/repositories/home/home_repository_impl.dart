import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';
import 'package:e_commerce/domain/repositories/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repositories/data_sources/remote_data_sources/home/remote_home_data_source.dart';

@Injectable(as:HomeRepository )
class HomeRepositoryImpl implements HomeRepository{
  RemoteHomeDataSource remoteHomeDataSource;
  HomeRepositoryImpl({required this.remoteHomeDataSource});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories()async {
    var either = await remoteHomeDataSource.getAllCategories();
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async{
    var either = await remoteHomeDataSource.getAllBrands();
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts()async {
    var either =await remoteHomeDataSource.getAllProducts();
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

}