import 'package:dartz/dartz.dart';

import 'package:my_crypto_app/core/api/exceptions/contracts/failure.dart';

import 'package:my_crypto_app/core/api/service/contracts/api_response.dart';
import 'package:my_crypto_app/core/data/models/chart_model.dart';

import 'package:my_crypto_app/core/data/models/coin_model.dart';

import '../../../core/api/api_services.dart';
import '../../../core/storage/istorage.dart';
import 'ihome_repository.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final LocalStorage localDataSource;
  ApiServices? remoteDataSource;

  HomeRepositoryImpl({required this.localDataSource, this.remoteDataSource});

  @override
  Future<Either<Failure, ApiResponse<List<CoinModel>>>> getCoinList() async {
    return await remoteDataSource!.getCoinList();
  }

  @override
  Future<String?> getFavorites() async {
    return await localDataSource.getFavorites();
  }

  @override
  Future<void> removeFavorite(String symbol) async {
    return await localDataSource.removeFavorite(symbol);
  }

  @override
  Future<void> saveFavorite(String symbol) async {
    return await localDataSource.saveFavorite(symbol);
  }

  @override
  Future<Either<Failure, ApiResponse<List<ChartModel>>>> getOhlc(
      {String? day, String? symbol}) async {
    return await remoteDataSource!.getOhlc(day: day, symbol: symbol);
  }
}
