import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../istorage.dart';

class SharedPreferenceImpl implements CacheStorage {
  Future<SharedPreferences> getPrefs() {
    return SharedPreferences.getInstance();
  }

  @override
  Future<String?> getFavorites() async {
    return getPrefs().then((value) => value.getString('favorites'));
  }

  @override
  Future saveFavorite(String symbol) async {
    print('in save');
    String? favorites = await getFavorites();

    List<dynamic> myFavorites = favorites == null ? [] : jsonDecode(favorites);
    myFavorites.add(symbol);
    return getPrefs().then(
      (value) {
        return value.setString('favorites', jsonEncode(myFavorites));
      },
    );
  }

  @override
  Future removeFavorite(String symbol) async {
    print('in remove');
    String? favorites = await getFavorites();

    List<dynamic> myFavorites = favorites == null ? [] : jsonDecode(favorites);
    if (myFavorites.contains(symbol)) {
      myFavorites.remove(symbol);
    }
    return getPrefs().then(
      (value) {
        return value.setString('favorites', jsonEncode(myFavorites));
      },
    );
  }
}
