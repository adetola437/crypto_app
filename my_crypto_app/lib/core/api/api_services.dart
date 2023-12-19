
import 'package:dartz/dartz.dart';
import 'package:my_crypto_app/core/data/models/chart_model.dart';
import 'package:my_crypto_app/core/data/models/coin_model.dart';
import '../data/models/login.dart';
import 'exceptions/contracts/failure.dart';
import 'service/contracts/api_response.dart';

abstract class ApiServices{
  Future<Either<Failure, ApiResponse<Login>>> login(String username, String password);
   Future<Either<Failure, ApiResponse<List<CoinModel>>>> getCoinList();
   Future<Either<Failure, ApiResponse<List<ChartModel>>>> getOhlc({String? day, String? symbol});
}