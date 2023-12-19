part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  List<dynamic> favorites;

  FavoritesLoaded({required this.favorites});

    @override
  List<Object> get props => [favorites];
}
final class FavoritesListLoaded extends FavoritesState {
 final List<CoinModel> favorites;

  const FavoritesListLoaded({required this.favorites});

    @override
  List<Object> get props => [favorites];
}
