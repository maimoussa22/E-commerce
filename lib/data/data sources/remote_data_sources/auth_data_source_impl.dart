import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_point.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_sources/remote_auth_data_source.dart';
import 'package:injectable/injectable.dart';
import '../../model/RegisterResponseDM.dart';

@Injectable(as: RemoteAuthDataSource)
class RemoteAuthDataSourceImpl extends RemoteAuthDataSource{
  ApiManager apiManager;
  RemoteAuthDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDm>> register(String name, String email,
      String password, String rePassword, String phone) async {
    final List<ConnectivityResult> connectivityResult = await
    (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) || 
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await apiManager.postData(endPoint: EndPoints.signUp,
          body: {
            "name": name,
            "email": email,
            "password": password,
            "rePassword": rePassword,
            "phone": phone
          });
      var registerResponse = RegisterResponseDm.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(errorMessage: registerResponse.message!));
      }
    }else{
      return Left(NetworkError(errorMessage: 'No Internet Connection . please check internet '));
    }
  }

}