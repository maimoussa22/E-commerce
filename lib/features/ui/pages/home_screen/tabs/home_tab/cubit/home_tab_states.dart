import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';

abstract class HomeTabStates{}
class CategoryInitialState extends HomeTabStates{}
class CategoryLoadingState extends HomeTabStates{}
class CategoryErrorState extends HomeTabStates{
  Failures error;
  CategoryErrorState({required this.error});
}
class CategorySuccessState extends HomeTabStates{
  CategoryOrBrandResponseEntity categoryOrBrandResponseEntity;
  CategorySuccessState({required this.categoryOrBrandResponseEntity});
}
class BrandInitialState extends HomeTabStates{}
class BrandLoadingState extends HomeTabStates{}
class BrandErrorState extends HomeTabStates{
  Failures error;
  BrandErrorState({required this.error});
}
class BrandSuccessState extends HomeTabStates{
  CategoryOrBrandResponseEntity categoryOrBrandResponseEntity;
  BrandSuccessState({required this.categoryOrBrandResponseEntity});
}