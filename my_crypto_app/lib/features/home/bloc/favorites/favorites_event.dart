part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class SaveFavoriteEvent extends FavoritesEvent {
  final CoinModel coin;

const SaveFavoriteEvent({required this.coin});
}
class RemoveFavoriteEvent extends FavoritesEvent {
  final CoinModel coin;

const RemoveFavoriteEvent({required this.coin});
}
class GetFavoritesEvent extends FavoritesEvent{}
