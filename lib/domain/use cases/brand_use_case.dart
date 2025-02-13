import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/repositories/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';

@injectable
class BrandUseCase{
  HomeRepository homeRepository;
  BrandUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>>invoke(){
    return homeRepository.getAllBrands();
  }
}