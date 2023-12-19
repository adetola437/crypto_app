import 'package:dartz/dartz.dart';

import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/api/service/contracts/api_response.dart';
import '../../../core/data/models/chart_model.dart';
import '../../../core/data/models/coin_model.dart';

abstract class IHomeRepository {
Future<Either<Failure, ApiResponse<List<CoinModel>>>> getCoinList();
  Future<String?> getFavorites();
  Future<void> saveFavorite(String symbol);
    Future<void> removeFavorite(String symbol);
    Future<Either<Failure, ApiResponse<List<ChartModel>>>> getOhlc({String? day, String? symbol});
}
