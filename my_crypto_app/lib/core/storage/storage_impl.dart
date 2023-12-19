import 'istorage.dart';

class LocalStorageImpl implements LocalStorage {
  final DatabaseStorage databaseStorage;
  final CacheStorage cacheStorage;

  LocalStorageImpl({required this.databaseStorage, required this.cacheStorage});

  @override
  Future<String?> getFavorites() async {
    return await cacheStorage.getFavorites();
  }

  @override
  Future<void> saveFavorite(String symbol) async {
    return await cacheStorage.saveFavorite(symbol);
  }

  @override
  Future<void> removeFavorite(String symbol)async {
 return await cacheStorage.removeFavorite(symbol);
  }
}
