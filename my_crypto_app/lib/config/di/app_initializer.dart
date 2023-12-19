
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:my_crypto_app/features/home/bloc/favorites/favorites_bloc.dart';
import 'package:my_crypto_app/features/home/bloc/portfolio/portfolio_bloc.dart';
import 'package:my_crypto_app/features/home/repository/home_repository_impl.dart';
import 'package:my_crypto_app/features/home/repository/ihome_repository.dart';


import '../../core/api/api_services.dart';
import '../../core/api/api_services_impl.dart';
import '../../core/api/network/network_info.dart';
import '../../core/api/service/contracts/api_client.dart';
import '../../core/api/service/dio_client.dart';
import '../../core/core.dart';
import '../../core/helpers/widget_helper.dart';
import '../../core/security/cryptosystem/aes_cryptosystem.dart';
import '../../core/security/cryptosystem/cryptosystem.dart';
import '../../core/security/cryptosystem/icryptosystem.dart';
import '../../core/storage/cache/shared_preference_impl.dart';
import '../../core/storage/database/isar_impl.dart';
import '../../core/storage/istorage.dart';
import '../../core/storage/storage_impl.dart';
import '../../features/home/bloc/chart/chart_bloc.dart';
import '../../features/market/bloc/coin_detail/coin_detail_bloc.dart';
import '../../features/market/repository/imarket_repository.dart';
import '../../features/market/repository/market_repository.dart';


class AppInitializer {
  static late GetIt instanceLocator;

  AppInitializer._();

  static void close() {
    instanceLocator.reset();
  }

  static Future create() async {
    if (kDebugMode) {
      Bloc.observer = AppBlocObserver();
    }
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await ScreenUtil.ensureScreenSize();

    initializeDi();
  }

  static dynamic initGetIt() async {
    instanceLocator = GetIt.I;
    await create();
  }

  static dynamic logout() async {
    try {
      await instanceLocator.reset();
      await initGetIt();
    } catch (e) {
      // logger.d(e);
    }
  }

  static initSecurity(){
    instanceLocator.registerSingleton<ICryptoSystem>(AESCryptoSystem());
    instanceLocator.registerSingleton<CryptoSystemImpl>(CryptoSystemImpl(cryptoSystem: instanceLocator()));
  }

  static initHelper() {
    instanceLocator.registerSingleton<IWidgetHelper>(WidgetHelper());
  }

  static initBlocs() {
      instanceLocator.registerLazySingleton<PortfolioBloc>(
      () => PortfolioBloc(),
    );
     instanceLocator.registerLazySingleton<CoinDetailBloc>(
      () => CoinDetailBloc(marketRepository: instanceLocator(), connectivity: instanceLocator()),
    );
      instanceLocator.registerLazySingleton<FavoritesBloc>(
        
      () => FavoritesBloc(homeRepository: instanceLocator(), connectivity: instanceLocator()),
    );
      instanceLocator.registerLazySingleton<ChartBloc>(
      () => ChartBloc(homeRepository: instanceLocator(), ),
    );
  }

  static initUseCases() {
    //usecase
    // instanceLocator.registerLazySingleton(() => LoginUseCase(repository: instanceLocator()));
  }

  static initRepos() {
    //repository
    instanceLocator.registerLazySingleton<IHomeRepository>(
          () => HomeRepositoryImpl(
        remoteDataSource: instanceLocator(),
        localDataSource: instanceLocator(),
      ),
    );
       instanceLocator.registerLazySingleton<IMarketRepository>(
          () => MarketRepositoryImpl(
        remoteDataSource: instanceLocator(),
        localDataSource: instanceLocator(),
      ),
    );
  }

   static initRemoteDataSources() {
    //remote data sources
    instanceLocator
        .registerLazySingleton<NetworkInfo>(() => NetworkInfoImplementation());
    instanceLocator
        .registerLazySingleton<IApiClient>(() => DioClient(instanceLocator()));
    instanceLocator.registerLazySingleton<ApiServices>(
      () => ApiServicesImpl(
        apiClient: instanceLocator(),
      ),
    );
  }

  static initLocalDataSources() {
    //data sources
    instanceLocator.registerLazySingleton<CacheStorage>(() => SharedPreferenceImpl(),);
    instanceLocator.registerLazySingleton<DatabaseStorage>(() => IsarImpl(),);
    instanceLocator.registerLazySingleton<LocalStorage>(() => LocalStorageImpl(cacheStorage: instanceLocator(), databaseStorage: instanceLocator()),);
  }

  // initServices() {}

  static initializeDi() {
    initSecurity();
    initHelper();
    initLocalDataSources();
    initUseCases();
    initRemoteDataSources();
    initRepos();
    initBlocs();
    // initServices();
  }

  static void disposeInstance<T extends Bloc>(T blocInstance) {
    instanceLocator.unregister(instance: blocInstance);
  }
}