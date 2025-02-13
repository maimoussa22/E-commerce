import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';

class CategoryTabStates{}
class CategoryTabInitial extends CategoryTabStates{}
class CategoryTabLoading extends CategoryTabStates{}
class CategoryTabError extends CategoryTabStates{
  Failures error;
  CategoryTabError({required this.error});
}
class CategoryTabSuccess extends CategoryTabStates{
  ProductsResponseEntity productsResponseEntity;
  CategoryTabSuccess({required this.productsResponseEntity});
}