import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager{
  final dio = Dio();
  Future<Response>postData({required String endPoint,Object? body,
    Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers}){
    return  dio.post(ApiConstants.baseUrl+endPoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(headers: headers,validateStatus: (status)=>true),
    );
  }
  Future<Response>getData({required String endPoint,Object? body,
    Map<String, dynamic>? queryParameters,}){
    return  dio.get(ApiConstants.baseUrl+endPoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status)=>true)
    );
  }
}