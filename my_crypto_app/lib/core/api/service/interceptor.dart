// import 'dart:convert';
// import 'dart:io' show Platform;
// import 'package:dio/dio.dart';
//
//
// class ApiInterceptors extends InterceptorsWrapper {
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     final method = options.method;
//     final uri = options.uri;
//     final data = options.data;
//
//     if (options.uri.toString().contains("login") ||
//         options.uri.toString().contains(("socialSignupCheck")) ||
//         options.uri.toString().contains(("signup")) ||
//         options.uri.toString().contains(("forgotPassword"))) {
//       options.headers['auth_token'] = defaultToken;
//     }
//
//
//     options.headers['language'] = 'en';
//     //options.headers['device_id'] = Constants.deviceId;
//     options.headers['device_type'] = Platform.isAndroid ? "android" : "ios";
//     if (method == 'GET') {
//       //logger.log("✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}", printFullText: true);
//     } else {
//       try {
//         //logger.log("✈️ REQUEST[$method] => PATH: $uri \n Token:${options.headers} \n DATA: ${jsonEncode(data)}", printFullText: true);
//       } catch (e) {
//         //logger.log("✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers} \n DATA: $data", printFullText: true);
//       }
//     }
//     super.onRequest(options, handler);
//   }
//
//   @override
//   Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
//     final statusCode = response.statusCode;
//     final uri = response.requestOptions.uri;
//     final data = jsonEncode(response.data);
//     //logger.log("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data", printFullText: true);
//
//     //handle error state
//     if (response.data["code"] == 0) {
//
//     } else {
//       super.onResponse(response, handler);
//     }
//     //Handle section expired
//   }
//
//   @override
//   Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
//     final statusCode = err.response?.statusCode!;
//     final uri = err.requestOptions.path;
//     var data = "";
//
//     if (err.type == DioErrorType.sendTimeout || err.type == DioErrorType.connectTimeout || err.type == DioErrorType.receiveTimeout) {
//       //const SnackBar(content: Text("No Internet Available!"));
//     } else if (err.type == DioErrorType.response) {
//       if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
//       } else {
//         //SnackBar(content: Text(err.response?.statusMessage ?? ""));
//       }
//     } else {
//       //SnackBar(content: Text(err.response?.statusMessage ?? ""));
//     }
//
//     try {
//       data = jsonEncode(err.response!.data);
//     } catch (e) {}
//     //logger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data", printFullText: true);
//     super.onError(err, handler);
//   }
// }