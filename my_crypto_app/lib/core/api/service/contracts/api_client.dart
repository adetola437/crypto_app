import 'package:dartz/dartz.dart';

import '../../../enums/api_method_types.dart';
import '../../exceptions/contracts/failure.dart';
import 'api_response.dart';

abstract class IApiClient {
  setToken(String token);
  clearToken();
 

  Future<Either<Failure, ApiResponse<T>>> request<T>(String url,
      MethodType method, T Function(dynamic) fromJson, dynamic params,
      {Map<String, dynamic>? queryParameters, dynamic testResponse});

  Future<Either<Failure, ApiResponse<T>>> multipartRequest<T>(
    String url,
    MethodType method,
    T Function(dynamic) fromJson,
    dynamic params,
  {dynamic testResponse}
  );
  Future<Either<Failure, ApiResponse<T>>> multipartImageRequest<T>(
    String url,
    MethodType method,
    T Function(dynamic) fromJson,
    dynamic files,
  {dynamic testResponse}
  );
}
