import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts();
}