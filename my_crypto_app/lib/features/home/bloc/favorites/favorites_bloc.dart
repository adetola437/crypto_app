import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/api/network/network_info.dart';
import '../../../../core/data/models/coin_model.dart';
import '../../repository/ihome_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  late IHomeRepository homeRepository;
  late NetworkInfo connectivity;
  FavoritesBloc({required this.homeRepository, required this.connectivity})
      : super(FavoritesInitial()) {
    on<SaveFavoriteEvent>((event, emit) => _saveFavoriteEvent(event, emit));
    on<RemoveFavoriteEvent>((event, emit) => _removeFavoriteEvent(event, emit));
    on<GetFavoritesEvent>((event, emit) => _getFavoritesEvent(event, emit));
  }
  List<CoinModel> favoritesList = [];
  _saveFavoriteEvent(SaveFavoriteEvent event, emit) async {
    emit(FavoritesLoading());
    if (!favoritesList.contains(event.coin)) {
      favoritesList.add(event.coin);
    }
    emit(FavoritesListLoaded(favorites: favoritesList));
    // String? json = await homeRepository.getFavorites();
    // List<dynamic> jsonList = jsonDecode(json ?? '');
    // if (jsonList.contains(event.symbol)) {
    // } else {
    //   await homeRepository.saveFavorite(event.symbol);
    // }
    // String? jsonFavorites = await homeRepository.getFavorites();
    // List<dynamic> myFavorites = jsonDecode(jsonFavorites ?? '');
    // print(myFavorites);
    // emit(FavoritesLoaded(favorites: myFavorites));
  }

  _removeFavoriteEvent(RemoveFavoriteEvent event, emit) async {
    emit(FavoritesLoading());
    if (favoritesList.contains(event.coin)) {
      favoritesList.remove(event.coin);
    }
    emit(FavoritesListLoaded(favorites: favoritesList));
    // await homeRepository.removeFavorite(event.symbol);
    // String? jsonFavorites = await homeRepository.getFavorites();
    // List<dynamic> myFavorites = jsonDecode(jsonFavorites!);
    // print(myFavorites);
    // emit(FavoritesLoaded(favorites: myFavorites));
  }

  _getFavoritesEvent(GetFavoritesEvent event, emit) async {
    emit(FavoritesListLoaded(favorites: favoritesList));
  }
}
