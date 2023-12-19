import 'package:dartz/dartz.dart';

import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/api/service/contracts/api_response.dart';
import '../../../core/data/models/coin_model.dart';

abstract class IMarketRepository {
  Future<Either<Failure, ApiResponse<List<CoinModel>>>> getCoinList();
}
