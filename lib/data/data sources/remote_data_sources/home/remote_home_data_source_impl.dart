import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/data/model/CategoryOrBrandResponseDM.dart';
import 'package:e_commerce/data/model/ProductsResponseDM.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_sources/home/remote_home_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/end_point.dart';

@Injectable(as: RemoteHomeDataSource)
class RemoteHomeDataSourceImpl implements RemoteHomeDataSource{
  ApiManager apiManager;
  RemoteHomeDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllCategories()async {
    try {
      final List<ConnectivityResult> connectivityResult = await
        (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(endPoint: EndPoints.getAllCategories
        );

        var categoryResponse = CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerError(errorMessage: categoryResponse.message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'No Internet Connection . please check internet '));
      }
    }catch(e){
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllBrands() async{
    try {
      final List<ConnectivityResult> connectivityResult = await
        (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(endPoint: EndPoints.getAllBrands
        );

        var brandResponse = CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandResponse);
        } else {
          return Left(ServerError(errorMessage: brandResponse.message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'No Internet Connection . please check internet '));
      }
    }catch(e){
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductsResponseDm>> getAllProducts()async {
    try {
      final List<ConnectivityResult> connectivityResult = await
        (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(endPoint: EndPoints.getAllProducts
        );

        var productResponse = ProductsResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errorMessage: productResponse.message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'No Internet Connection . please check internet '));
      }
    }catch(e){
      return Left(Failures(errorMessage: e.toString()));
    }
  }

}