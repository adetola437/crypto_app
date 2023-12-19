import 'package:dartz/dartz.dart';

import '../../../core/api/api_services.dart';
import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/api/service/contracts/api_response.dart';
import '../../../core/data/models/coin_model.dart';
import '../../../core/storage/istorage.dart';
import 'imarket_repository.dart';

class MarketRepositoryImpl implements IMarketRepository {
  final LocalStorage localDataSource;
  ApiServices? remoteDataSource;

  MarketRepositoryImpl({required this.localDataSource, this.remoteDataSource});

  @override
  Future<Either<Failure, ApiResponse<List<CoinModel>>>> getCoinList() async {
    return await remoteDataSource!.getCoinList();
  }
}
