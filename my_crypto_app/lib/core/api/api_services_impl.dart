import 'package:dartz/dartz.dart';
import 'package:my_crypto_app/core/data/models/chart_model.dart';
import 'package:my_crypto_app/core/data/models/coin_model.dart';

import '../data/models/login.dart';
import '../enums/api_method_types.dart';
import 'api_services.dart';
import 'exceptions/contracts/failure.dart';
import 'service/contracts/api_client.dart';
import 'service/contracts/api_response.dart';
import 'service/endpoints.dart';

class ApiServicesImpl implements ApiServices {
  final IApiClient apiClient;

  ApiServicesImpl({required this.apiClient});

  @override
  Future<Either<Failure, ApiResponse<Login>>> login(
          String username, String password) =>
      apiClient.request(
          ApiEndpoint.login,
          MethodType.post,
          (response) => Login.fromJson(response),
          {"username": username, "password": password});

  @override
  Future<Either<Failure, ApiResponse<List<CoinModel>>>> getCoinList() async {
    return await apiClient.request(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=true&locale=en',
        MethodType.get,
        (data) =>
            (data as List).map((coin) => CoinModel.fromJson(coin)).toList(),
        {});
  }

  @override
  Future<Either<Failure, ApiResponse<List<ChartModel>>>> getOhlc(
      {String? day, String? symbol}) async {
    return await apiClient.request(
        'https://api.coingecko.com/api/v3/coins/$symbol/ohlc?vs_currency=usd&days=$day',
        MethodType.get, (data) =>
      (data as List).map((e) => ChartModel.fromJson(e)).toList()
    , {});
  }
}
