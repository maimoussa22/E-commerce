import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../entities/CategoryOrBrandResponseEntity.dart';

abstract class RemoteHomeDataSource{
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts();
}