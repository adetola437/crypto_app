import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_performance_dio/firebase_performance_dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../config/flavor/flavor.dart';
import '../../enums/api_method_types.dart';
import '../exceptions/api_exception.dart';
import '../exceptions/contracts/failure.dart';
import '../network/network_info.dart';
import 'api_response_impl.dart';
import 'contracts/api_client.dart';
import 'contracts/api_response.dart';

class DioClient implements IApiClient {
  late Dio _dio;
  late NetworkInfo networkInfo;

  ///setup [optional here, should be part of app initializer class]
  static void setup() {
    GetIt.instance.registerFactoryParam<DioClient, NetworkInfo, void>(
      (networkInfoImpl, _) => DioClient.createInstance(networkInfoImpl),
    );
  }

  factory DioClient.createInstance(NetworkInfo value) {
    return DioClient(value);
  }

  //static DioClient get instance => GetIt.I<DioClient>();

  DioClient(this.networkInfo) {
    _dio = Dio(BaseOptions())
      ..options.connectTimeout = const Duration(seconds: 20)
      ..options.sendTimeout = const Duration(seconds: 20)
      ..options.receiveTimeout = const Duration(seconds: 20)
      ..interceptors.add(DioFirebasePerformanceInterceptor())
      ..interceptors.add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90),
      );
  }


  Future<Response<dynamic>> retry<T>(
      RequestOptions requestOptions, Dio dio) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  @override
  Future<Either<Failure, ApiResponse<T>>> request<T>(String url,
      MethodType method, T Function(dynamic) fromJson, dynamic params,
      {Map<String, dynamic>? queryParameters, dynamic testResponse}) async {
    try {
      Response response;
      // if (await networkInfo.isConnected()) {

      switch (method) {
        case MethodType.post:
          response = await _dio.post(url,
              data: params, queryParameters: queryParameters);
          break;
        case MethodType.delete:
          response = await _dio.delete(url,
              data: params, queryParameters: queryParameters);
          break;
        case MethodType.patch:
          response = await _dio.patch(url,
              data: params, queryParameters: queryParameters);
          break;
        case MethodType.get:
          response = await _dio.get(url,
              data: params, queryParameters: queryParameters);
          break;
        case MethodType.put:
          response = await _dio.put(url,
              data: params, queryParameters: queryParameters);
          break;
      }
      if (_isRequestSuccessful(response.statusCode)) {
        return 
        // response.data.containsKey("data")
        //     ? right(ApiResponseImpl<T>(
        //         fromJson(response.data['data']),
        //         response.data['errors'],
        //         response.data['message'],
        //         response.data['responseCode'],
        //       ))
        //     : 
            right(ApiResponseImpl<T>(
                fromJson(response.data),
               null,
               null,null
              ));
      }
      var requestResponse = ApiResponseImpl<T>(
        null,
       null,
               null,null
      );

      return left(ValidationFailure(requestResponse.errorMessage!));
      //  return left(ValidationFailure(requestResponse.errorMessage!));
      // } else {
      //   return left(InternetFailure());
      // }
    } on DioException catch (dioError) {
      return left(_handleDioError(dioError));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<T>>> multipartRequest<T>(String url,
      MethodType method, T Function(dynamic) fromJson, dynamic params,
      {Map<String, dynamic>? queryParameters, dynamic testResponse}) async {
    try {
      Response response;
      // if (await networkInfo.isConnected()) {
      response = await _dio.post(
        url,
        data: params,
      );
      if (_isRequestSuccessful(response.statusCode)) {
        var requestResponse = ApiResponseImpl<T>(
          fromJson(response.data['data']),
          response.data['errors'],
          response.data['message'],
          response.data['responseCode'],
        );
        return right(requestResponse);
      }
      var requestResponse = ApiResponseImpl<T>(
        null,
        response.data['errors'],
        response.data['message'],
        response.data['responseCode'],
      );
      return left(ValidationFailure(requestResponse.message));
      // } else {
      //   return left(InternetFailure());
      // }
    } on DioException catch (dioError) {
      return left(_handleDioError(dioError));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<T>>> multipartImageRequest<T>(String url,
      MethodType method, T Function(dynamic) fromJson, dynamic files,
      {dynamic testResponse}) async {
    try {
      Response response;

      FormData formData = FormData();
      if (files is File) {
        formData = FormData.fromMap({
          'image': await MultipartFile.fromFile(files.path),
        });
      } else if (files is List<File>) {
        formData = FormData.fromMap({
          for (int i = 0; i < files.length; i++)
            'image[$i]': await MultipartFile.fromFile(files[i].path),
        });
      } else {
        throw ArgumentError('Unsupported files type');
      }
      switch (method) {
        case MethodType.post:
          response = await _dio.post(
            url,
            data: formData,
          );
          break;
        case MethodType.delete:
          response = await _dio.post(
            url,
            data: formData,
          );
          break;
        case MethodType.patch:
          response = await _dio.post(
            url,
            data: formData,
          );
        case MethodType.get:
          response = await _dio.post(
            url,
            data: formData,
          );
        case MethodType.put:
          response = await _dio.put(
            url,
            data: formData,
          );
          break;
      }
      // response = await _dio.post(
      //   url,
      //   data: formData,
      // );

      if (_isRequestSuccessful(response.statusCode)) {
        var requestResponse = ApiResponseImpl<T>(
          fromJson(response.data['data']),
          response.data['errors'],
          response.data['message'],
          response.data['responseCode'],
        );
        return right(requestResponse);
      }

      var requestResponse = ApiResponseImpl<T>(
        null,
        response.data['errors'],
        response.data['message'],
        response.data['responseCode'],
      );
      return left(ValidationFailure(requestResponse.message));
    } on DioException catch (dioError) {
      return left(_handleDioError(dioError));
    }
  }

  bool _isRequestSuccessful(int? statusCode) =>
      statusCode == 200 || statusCode == 201;

  Failure _handleDioError(DioException error) {
    if (error.error != null && error.error is SocketException) {
      return InternetFailure();
    }
    if (error.response != null) {
      // Handle error response from the server
      final apiResponse = ApiResponseImpl(
        null, // Data (can be null in case of an error)
        error.response?.data['errors'], // Error data
        error.response?.data['message'], // Simple error message
        error.response?.data['responseCode'], // Response code
      );

      final errorMessage = apiResponse.errorMessage;
      // log(errorMessage);
      return ValidationFailure(errorMessage ?? 'An error occurred');
    }

    late Failure failureType;
    switch (error.type) {
      case DioExceptionType.cancel:
        failureType = CancelFailure();
        break;
      case DioExceptionType.connectionTimeout:
        failureType = ConnectionTimeOutFailure();
        break;
      case DioExceptionType.connectionError:
        failureType = ConnectionFailure();
        break;
      case DioExceptionType.badCertificate:
        failureType = BadCertificateFailure();
        break;
      case DioExceptionType.badResponse:
        failureType = BadResponseFailure();
        break;
      case DioExceptionType.receiveTimeout:
        failureType = ReceivedTimeOutFailure();
        break;
      case DioExceptionType.sendTimeout:
        failureType = SendTimeOutFailure();
        break;
      case DioExceptionType.unknown:
        failureType = ServerFailure();
        break;
    }
    return failureType;
  }

  @override
  clearToken() {
    _dio.options.headers.remove('Authorization');
  }

  @override
  setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }
}
