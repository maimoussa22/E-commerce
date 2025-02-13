import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';
import 'package:e_commerce/domain/repositories/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';

@injectable
class ProductUseCase{
  HomeRepository homeRepository;
  ProductUseCase({required this.homeRepository});

  Future<Either<Failures, ProductsResponseEntity>>invoke(){
    return homeRepository.getAllProducts();
  }
}